-- Synthetic Dashboard illustration for the isolated local editorial database.
-- Run only with: psql -X -v ON_ERROR_STOP=1 -d hellotext_editorial_capture_20260926 -f this_file
-- This inserts no contacts, campaigns, orders, messages, or delivery jobs.

BEGIN;

DO $fixture$
DECLARE
  fixture_tag CONSTANT text := 'dashboard_visual_completion_20260926';
  business_today date := (now() AT TIME ZONE 'America/Montevideo')::date;
  demo_contacts bigint[];
  metric_row record;
  revenue_row record;
  event_time timestamptz;
  event_id bigint;
  attributed_id bigint;
  revenue_id bigint;
  contact_id bigint;
BEGIN
  IF current_database() <> 'hellotext_editorial_capture_20260926' THEN
    RAISE EXCEPTION 'Refusing to modify a non-editorial database';
  END IF;
  IF business_today <> DATE '2026-09-26' THEN
    RAISE EXCEPTION 'Fixture dates require 2026-09-26 in the demonstration business timezone';
  END IF;
  IF (SELECT count(*) FROM businesses WHERE id = 5 AND handle = 'hellotext'
      AND timezone = 'Montevideo' AND reporting_currency = 'USD') <> 1 THEN
    RAISE EXCEPTION 'Demonstration business guard failed';
  END IF;
  IF (SELECT count(*) FROM track_actions WHERE (id, name, exposed) IN (
      (13, 'product.viewed', true), (23, 'cart.added', true),
      (26, 'checkout.started', true), (27, 'order.placed', true),
      (54, 'conversation.started', false))) <> 5 THEN
    RAISE EXCEPTION 'Demonstration action guard failed';
  END IF;
  IF EXISTS (SELECT 1 FROM dashboard_metrics WHERE business_id = 5)
      OR EXISTS (SELECT 1 FROM track_events WHERE business_id = 5
        AND metadata->>'editorial_fixture' = fixture_tag)
      OR EXISTS (SELECT 1 FROM attribution_revenues WHERE business_id = 5
        AND audit->>'editorial_fixture' = fixture_tag) THEN
    RAISE EXCEPTION 'Dashboard fixture already exists or the isolated baseline changed';
  END IF;

  SELECT array_agg(id ORDER BY id) INTO demo_contacts FROM contacts WHERE business_id = 5;
  IF coalesce(array_length(demo_contacts, 1), 0) < 6 THEN
    RAISE EXCEPTION 'Insufficient existing demonstration contacts';
  END IF;

  -- Four illustrated funnel actions, plus a conversation trend in both 14-day periods.
  FOR metric_row IN SELECT * FROM (VALUES
    (13, 1, 42, 0), (13, 4, 36, 0), (13, 8, 52, 0), (13, 12, 30, 0),
    (23, 1, 5, 5000000), (23, 4, 4, 4000000), (23, 8, 6, 6000000), (23, 12, 3, 3000000),
    (26, 1, 2, 3000000), (26, 4, 3, 4500000), (26, 8, 3, 4500000), (26, 12, 2, 3000000),
    (27, 1, 1, 2500000), (27, 4, 1, 2500000), (27, 8, 1, 2500000), (27, 12, 1, 2500000),
    (54, 1, 4, 0), (54, 3, 6, 0), (54, 5, 5, 0),
    (54, 7, 7, 0), (54, 10, 3, 0), (54, 12, 5, 0),
    (54, 15, 3, 0), (54, 17, 5, 0), (54, 19, 4, 0),
    (54, 21, 4, 0), (54, 24, 3, 0), (54, 26, 5, 0)
  ) AS rows(action_id, day_offset, event_count, money_subunits) LOOP
    event_time := (business_today - metric_row.day_offset + TIME '12:00')
      AT TIME ZONE 'America/Montevideo';
    INSERT INTO dashboard_metrics
      (business_id, action_id, bucket, amount_currency, count, amount_subunits, created_at, updated_at)
    VALUES (5, metric_row.action_id, event_time, 'USD', metric_row.event_count,
      metric_row.money_subunits, now(), now());
  END LOOP;

  -- Revenue rows illustrate the cards; they are synthetic facts, not a real attribution run.
  -- Current period: $1,000 recorded / $280 attributed = 28%; previous: $400 / $200.
  FOR revenue_row IN SELECT * FROM (VALUES
    (12, 2500000, 700000, 1), (8, 2500000, 700000, 2),
    (4, 2500000, 700000, 3), (1, 2500000, 700000, 4),
    (19, 2000000, 1000000, 5), (23, 2000000, 1000000, 6)
  ) AS rows(day_offset, total_subunits, credited_subunits, contact_index) LOOP
    contact_id := demo_contacts[revenue_row.contact_index];
    event_time := (business_today - revenue_row.day_offset + TIME '12:00')
      AT TIME ZONE 'America/Montevideo';

    INSERT INTO track_events
      (business_id, action_id, contact_id, tracked_at, amount_currency,
       amount_subunits, converted_amount_currency, converted_amount_subunits,
       metadata, created_at, updated_at)
    VALUES (5, 27, contact_id, event_time, 'USD', revenue_row.total_subunits,
      'USD', revenue_row.total_subunits,
      jsonb_build_object('editorial_fixture', fixture_tag, 'synthetic', true,
        'day_offset', revenue_row.day_offset), now(), now())
    RETURNING id INTO event_id;

    INSERT INTO attribution_revenues
      (business_id, event_id, action_id, contact_id, tracked_at, tracked_at_date,
       amount_subunits, amount_currency, converted_amount_subunits,
       converted_amount_currency, state, audit, created_at, updated_at)
    VALUES (5, event_id, 27, contact_id, event_time,
      (event_time AT TIME ZONE 'America/Montevideo')::date,
      revenue_row.credited_subunits, 'USD', revenue_row.credited_subunits,
      'USD', 'active', jsonb_build_object('editorial_fixture', fixture_tag,
        'synthetic', true, 'not_a_real_attribution_run', true), now(), now())
    RETURNING id INTO attributed_id;

    INSERT INTO track_revenues
      (business_id, contact_id, event_id, action_id, tracked_at, tracked_at_date,
       amount_subunits, amount_currency, converted_amount_subunits,
       converted_amount_currency, attribution_revenue_id, created_at, updated_at)
    VALUES (5, contact_id, event_id, 27, event_time,
      (event_time AT TIME ZONE 'America/Montevideo')::date,
      revenue_row.total_subunits, 'USD', revenue_row.total_subunits,
      'USD', attributed_id, now(), now())
    RETURNING id INTO revenue_id;

    INSERT INTO attribution_allocations
      (business_id, attribution_revenue_id, track_revenue_id,
       amount_subunits, amount_currency, converted_amount_subunits,
       converted_amount_currency, audit, created_at, updated_at)
    VALUES (5, attributed_id, revenue_id, revenue_row.credited_subunits,
      'USD', revenue_row.credited_subunits, 'USD',
      jsonb_build_object('editorial_fixture', fixture_tag, 'synthetic', true),
      now(), now());
  END LOOP;

  IF (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
      AND bucket >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 30
      OR (SELECT sum(converted_amount_subunits) FROM attribution_revenues
        WHERE business_id = 5 AND audit->>'editorial_fixture' = fixture_tag
          AND tracked_at_date >= business_today - 13) <> 2800000
      OR (SELECT sum(revenue.converted_amount_subunits) FROM track_revenues AS revenue
        WHERE revenue.business_id = 5 AND revenue.tracked_at_date >= business_today - 13
          AND revenue.event_id IN (SELECT id FROM track_events
            WHERE metadata->>'editorial_fixture' = fixture_tag)) <> 10000000 THEN
    RAISE EXCEPTION 'Dashboard fixture totals did not match the illustration plan';
  END IF;
END;
$fixture$;

COMMIT;
