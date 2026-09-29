-- Isolated editorial Billing fixture. Run only against the named local clone.
-- The script inserts synthetic source rows directly; it never invokes delivery,
-- campaign, payment, subscription, or attribution jobs.
\set ON_ERROR_STOP on
BEGIN;
DO $$
DECLARE
  target_db constant text := 'hellotext_editorial_billing_usage_20260929';
  item_id bigint;
  contact_id_for_item bigint;
  event_at timestamptz;
  feature_identifier text;
  i integer;
BEGIN
  IF current_database() <> target_db THEN RAISE EXCEPTION 'Wrong database'; END IF;
  IF NOT EXISTS (SELECT 1 FROM users WHERE id = 1 AND email = 'design-system@example.test' AND locale = 'es') THEN
    RAISE EXCEPTION 'Fictional owner guard failed';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM quotas WHERE id = 5 AND business_id = 5 AND package_id = 3 AND version = 2) THEN
    RAISE EXCEPTION 'Grow quota guard failed';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM products_prices WHERE id = 244 AND amount_subunits = 2990000 AND amount_currency = 'USD') THEN
    RAISE EXCEPTION 'Grow USD 299 price guard failed';
  END IF;
  IF NOT EXISTS (SELECT 1 FROM products_configuration_attributions WHERE id = 3 AND commission = 3) THEN
    RAISE EXCEPTION 'Attribution rate guard failed';
  END IF;
  IF EXISTS (SELECT 1 FROM contacts WHERE business_id = 5 AND subscription_state <> 'unconfirmed') THEN
    RAISE EXCEPTION 'Messageable contact guard failed';
  END IF;
  IF (SELECT count(*) FROM contacts WHERE business_id = 5) <> 127 THEN
    RAISE EXCEPTION 'Demo contact count changed';
  END IF;
  IF EXISTS (SELECT 1 FROM quota_transactions WHERE quota_id = 5) OR
     EXISTS (SELECT 1 FROM quota_features WHERE quota_id = 5 AND transactions_count <> 0) THEN
    RAISE EXCEPTION 'Quota usage is no longer empty';
  END IF;
  IF EXISTS (SELECT 1 FROM messages WHERE business_id = 5 AND metadata ? 'editorial_billing_usage_20260929') THEN
    RAISE EXCEPTION 'Fixture was already applied';
  END IF;
  FOREACH feature_identifier IN ARRAY ARRAY['attribution', 'sms', 'message_overage'] LOOP
    IF (SELECT count(*) FROM quota_features WHERE quota_id = 5 AND identifier = feature_identifier) <> 1 THEN
      RAISE EXCEPTION 'Missing quota feature %', feature_identifier;
    END IF;
  END LOOP;

  -- Twelve fictional USD 700 attributed sales, recorded in the exact quota
  -- transaction source used by the Billing presenter: USD 8,400 in total.
  FOR i IN 1..12 LOOP
    event_at := '2026-09-27 12:00:00+00'::timestamptz + make_interval(hours => i);
    INSERT INTO quota_transactions (quota_id, feature_id, amount, metadata,
      converted_revenue_subunits, converted_revenue_currency, created_at, updated_at)
    VALUES (5, 143, 1,
      jsonb_build_object('editorial_billing_usage_20260929', true, 'source', 'fictional_attributed_sale', 'sale_number', i),
      7000000, 'USD', event_at, event_at);
  END LOOP;

  -- Historical synthetic message rows have no transport/provider and are
  -- inserted without application callbacks or jobs. Contacts remain
  -- unconfirmed. Their linked quota rows populate Billing and its drilldowns.
  FOR i IN 1..1330 LOOP
    SELECT id INTO STRICT contact_id_for_item FROM contacts WHERE business_id = 5 ORDER BY id OFFSET ((i - 1) % 20) LIMIT 1;
    event_at := '2026-09-27 09:00:00+00'::timestamptz + make_interval(secs => i * 60);
    INSERT INTO messages (business_id, contact_id, technology_id, state, dispatched_at,
      state_updated_at, created_at, updated_at, metadata)
    VALUES (5, contact_id_for_item,
      CASE WHEN i <= 80 THEN 2 WHEN i <= 1080 THEN 1 ELSE 8 END,
      'delivered', event_at, event_at, event_at, event_at,
      jsonb_build_object('editorial_billing_usage_20260929', true, 'source', 'fictional_historical_message', 'sequence', i))
    RETURNING id INTO item_id;

    IF i <= 80 THEN
      INSERT INTO quota_transactions (quota_id, feature_id, transactionable_type,
        transactionable_id, profile_id, country_id, technology_id, amount, metadata,
        sms_segments_count, revenue_subunits, revenue_currency, created_at, updated_at)
      VALUES (5, 145, 'Message', item_id, contact_id_for_item, 236, 2, 1,
        jsonb_build_object('editorial_billing_usage_20260929', true, 'source', 'fictional_sms_charge'),
        CASE WHEN i <= 8 THEN 2 ELSE 1 END, 1500, 'USD', event_at, event_at);
    ELSE
      INSERT INTO quota_transactions (quota_id, feature_id, transactionable_type,
        transactionable_id, profile_id, technology_id, amount, metadata,
        created_at, updated_at)
      VALUES (5, 146, 'Message', item_id, contact_id_for_item,
        CASE WHEN i <= 1080 THEN 1 ELSE 8 END, 1,
        jsonb_build_object('editorial_billing_usage_20260929', true, 'source', 'fictional_non_sms_message'),
        event_at, event_at);
    END IF;
  END LOOP;

  UPDATE quota_features SET transactions_count = 80, updated_at = now() WHERE id = 145 AND quota_id = 5;
  UPDATE quota_features SET transactions_count = 1250, updated_at = now() WHERE id = 146 AND quota_id = 5;

  IF (SELECT sum(converted_revenue_subunits) FROM quota_transactions WHERE feature_id = 143) <> 84000000 OR
     (SELECT count(*) FROM quota_transactions WHERE feature_id = 145) <> 80 OR
     (SELECT sum(sms_segments_count) FROM quota_transactions WHERE feature_id = 145) <> 88 OR
     (SELECT sum(revenue_subunits) FROM quota_transactions WHERE feature_id = 145) <> 120000 OR
     (SELECT count(*) FROM quota_transactions WHERE feature_id = 146) <> 1250 OR
     (SELECT count(*) FROM messages WHERE business_id = 5 AND metadata ? 'editorial_billing_usage_20260929') <> 1330 THEN
    RAISE EXCEPTION 'Fixture reconciliation failed';
  END IF;
END $$;
COMMIT;
