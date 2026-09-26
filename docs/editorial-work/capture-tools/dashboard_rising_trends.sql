-- Refine only the tagged Dashboard illustration in the isolated local database.
-- Run after dashboard_visual_fixture.sql, on 2026-09-26 only:
-- psql -X -v ON_ERROR_STOP=1 -d hellotext_editorial_capture_20260926 -f this_file
-- This does not edit contact profiles or create orders, messages, campaigns or sends.

BEGIN;

DO $fixture$
DECLARE
  fixture_tag CONSTANT text := 'dashboard_visual_completion_20260926';
  business_today date := (now() AT TIME ZONE 'America/Montevideo')::date;
  attributed_dollars integer[] := ARRAY[14, 16, 17, 16, 18, 19, 19, 20, 21, 22, 21, 24, 25, 28];
  recorded_dollars integer[] := ARRAY[52, 58, 61, 58, 65, 68, 68, 71, 75, 79, 75, 86, 90, 94];
  conversation_counts integer[] := ARRAY[1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 4, 4];
  demo_contacts bigint[];
  day_offset integer;
  array_index integer;
  event_time timestamptz;
  fixture_event_id bigint;
  attributed_id bigint;
  revenue_id bigint;
  contact_id bigint;
  changed_rows integer;
BEGIN
  IF current_database() <> 'hellotext_editorial_capture_20260926'
      OR business_today <> DATE '2026-09-26'
      OR (SELECT count(*) FROM businesses WHERE id = 5 AND handle = 'hellotext'
        AND timezone = 'Montevideo' AND reporting_currency = 'USD') <> 1 THEN
    RAISE EXCEPTION 'Refusing to change a database, business or date outside the isolated editorial fixture';
  END IF;

  IF (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5) <> 28
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 13) <> 160
      OR (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> 4
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> 4
      OR (SELECT sum(amount_subunits) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> 10000000
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 23) <> 18
      OR (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 23) <> 4
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 26) <> 10
      OR (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 26) <> 4
      OR (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
        AND bucket >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 6
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
        AND bucket >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 30
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
        AND bucket < (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 24 THEN
    RAISE EXCEPTION 'Dashboard metric baseline differs from the documented synthetic fixture';
  END IF;

  IF (SELECT array_agg(business_today - (bucket AT TIME ZONE 'America/Montevideo')::date
        ORDER BY business_today - (bucket AT TIME ZONE 'America/Montevideo')::date)
        FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> ARRAY[1, 4, 8, 12]
      OR (SELECT array_agg(business_today - (bucket AT TIME ZONE 'America/Montevideo')::date
        ORDER BY business_today - (bucket AT TIME ZONE 'America/Montevideo')::date)
        FROM dashboard_metrics WHERE business_id = 5 AND action_id = 23) <> ARRAY[1, 4, 8, 12]
      OR (SELECT array_agg(business_today - (bucket AT TIME ZONE 'America/Montevideo')::date
        ORDER BY business_today - (bucket AT TIME ZONE 'America/Montevideo')::date)
        FROM dashboard_metrics WHERE business_id = 5 AND action_id = 26) <> ARRAY[1, 4, 8, 12]
      OR (SELECT array_agg(business_today - (bucket AT TIME ZONE 'America/Montevideo')::date
        ORDER BY business_today - (bucket AT TIME ZONE 'America/Montevideo')::date)
        FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
          AND bucket >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo')
        <> ARRAY[1, 3, 5, 7, 10, 12] THEN
    RAISE EXCEPTION 'Synthetic Dashboard metric dates differ from the documented baseline';
  END IF;

  IF (SELECT count(*) FROM track_events WHERE business_id = 5
        AND metadata->>'editorial_fixture' = fixture_tag) <> 6
      OR (SELECT count(*) FROM track_events WHERE business_id = 5
        AND metadata->>'editorial_fixture' = fixture_tag
        AND tracked_at >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 4
      OR (SELECT count(*) FROM attribution_revenues WHERE business_id = 5
        AND audit->>'editorial_fixture' = fixture_tag) <> 6
      OR (SELECT count(*) FROM track_revenues AS revenue JOIN track_events AS event
        ON event.id = revenue.event_id WHERE event.business_id = 5
        AND event.metadata->>'editorial_fixture' = fixture_tag) <> 6
      OR (SELECT count(*) FROM attribution_allocations AS allocation
        JOIN attribution_revenues AS attributed ON attributed.id = allocation.attribution_revenue_id
        WHERE attributed.business_id = 5 AND attributed.audit->>'editorial_fixture' = fixture_tag) <> 6
      OR (SELECT sum(converted_amount_subunits) FROM attribution_revenues
        WHERE business_id = 5 AND audit->>'editorial_fixture' = fixture_tag
          AND tracked_at_date >= business_today - 13) <> 2800000
      OR (SELECT sum(revenue.converted_amount_subunits) FROM track_revenues AS revenue
        JOIN track_events AS event ON event.id = revenue.event_id
        WHERE event.business_id = 5 AND event.metadata->>'editorial_fixture' = fixture_tag
          AND revenue.tracked_at_date >= business_today - 13) <> 10000000 THEN
    RAISE EXCEPTION 'Revenue baseline differs from the documented synthetic fixture';
  END IF;

  IF (SELECT array_agg(business_today - (tracked_at AT TIME ZONE 'America/Montevideo')::date
        ORDER BY business_today - (tracked_at AT TIME ZONE 'America/Montevideo')::date)
        FROM track_events WHERE business_id = 5
          AND metadata->>'editorial_fixture' = fixture_tag
          AND tracked_at >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo')
      <> ARRAY[1, 4, 8, 12] THEN
    RAISE EXCEPTION 'Tagged synthetic revenue dates differ from the documented baseline';
  END IF;

  IF (SELECT sum(amount) FROM unnest(attributed_dollars) AS points(amount)) <> 280
      OR (SELECT sum(amount) FROM unnest(recorded_dollars) AS points(amount)) <> 1000
      OR (SELECT sum(amount) FROM unnest(conversation_counts) AS points(amount)) <> 30 THEN
    RAISE EXCEPTION 'The planned trend arrays do not preserve the displayed totals';
  END IF;

  SELECT array_agg(id ORDER BY id) INTO demo_contacts FROM contacts WHERE business_id = 5;
  IF coalesce(array_length(demo_contacts, 1), 0) < 6 THEN
    RAISE EXCEPTION 'Insufficient existing local demonstration contacts';
  END IF;

  -- The original fixture has one order metric and one revenue fact on four days.
  -- Keep those dates and rows, update their synthetic amounts, and add the ten missing days.
  FOR day_offset IN 0..13 LOOP
    array_index := 14 - day_offset;
    event_time := (business_today - day_offset + TIME '12:00')
      AT TIME ZONE 'America/Montevideo';

    UPDATE dashboard_metrics SET count = 1,
      amount_subunits = recorded_dollars[array_index] * 10000, updated_at = now()
    WHERE business_id = 5 AND action_id = 27 AND bucket = event_time AND amount_currency = 'USD';
    GET DIAGNOSTICS changed_rows = ROW_COUNT;
    IF changed_rows = 0 THEN
      INSERT INTO dashboard_metrics
        (business_id, action_id, bucket, amount_currency, count, amount_subunits, created_at, updated_at)
      VALUES (5, 27, event_time, 'USD', 1, recorded_dollars[array_index] * 10000, now(), now());
    ELSIF changed_rows <> 1 THEN
      RAISE EXCEPTION 'Unexpected order metric count on day offset %', day_offset;
    END IF;

    UPDATE dashboard_metrics SET count = conversation_counts[array_index], updated_at = now()
    WHERE business_id = 5 AND action_id = 54 AND bucket = event_time AND amount_currency = 'USD';
    GET DIAGNOSTICS changed_rows = ROW_COUNT;
    IF changed_rows = 0 THEN
      INSERT INTO dashboard_metrics
        (business_id, action_id, bucket, amount_currency, count, amount_subunits, created_at, updated_at)
      VALUES (5, 54, event_time, 'USD', conversation_counts[array_index], 0, now(), now());
    ELSIF changed_rows <> 1 THEN
      RAISE EXCEPTION 'Unexpected conversation metric count on day offset %', day_offset;
    END IF;

    SELECT id INTO fixture_event_id FROM track_events
    WHERE business_id = 5 AND metadata->>'editorial_fixture' = fixture_tag
      AND tracked_at = event_time;
    IF fixture_event_id IS NOT NULL THEN
      UPDATE track_events SET amount_subunits = recorded_dollars[array_index] * 10000,
        converted_amount_subunits = recorded_dollars[array_index] * 10000,
        metadata = metadata || '{"rising_trend_refinement":true}'::jsonb,
        updated_at = now() WHERE id = fixture_event_id;
      UPDATE attribution_revenues AS attributed SET amount_subunits = attributed_dollars[array_index] * 10000,
        converted_amount_subunits = attributed_dollars[array_index] * 10000,
        audit = audit || '{"rising_trend_refinement":true}'::jsonb,
        updated_at = now() WHERE attributed.event_id = fixture_event_id AND attributed.business_id = 5
        AND attributed.audit->>'editorial_fixture' = fixture_tag
      RETURNING id INTO attributed_id;
      GET DIAGNOSTICS changed_rows = ROW_COUNT;
      IF changed_rows <> 1 THEN RAISE EXCEPTION 'Tagged attribution missing on day offset %', day_offset; END IF;
      UPDATE track_revenues SET amount_subunits = recorded_dollars[array_index] * 10000,
        converted_amount_subunits = recorded_dollars[array_index] * 10000,
        updated_at = now() WHERE attribution_revenue_id = attributed_id
      RETURNING id INTO revenue_id;
      GET DIAGNOSTICS changed_rows = ROW_COUNT;
      IF changed_rows <> 1 THEN RAISE EXCEPTION 'Tagged revenue missing on day offset %', day_offset; END IF;
      UPDATE attribution_allocations SET amount_subunits = attributed_dollars[array_index] * 10000,
        converted_amount_subunits = attributed_dollars[array_index] * 10000,
        audit = audit || '{"rising_trend_refinement":true}'::jsonb,
        updated_at = now() WHERE attribution_revenue_id = attributed_id AND track_revenue_id = revenue_id;
      GET DIAGNOSTICS changed_rows = ROW_COUNT;
      IF changed_rows <> 1 THEN RAISE EXCEPTION 'Tagged allocation missing on day offset %', day_offset; END IF;
    ELSE
      contact_id := demo_contacts[(day_offset % 6) + 1];
      INSERT INTO track_events
        (business_id, action_id, contact_id, tracked_at, amount_currency,
         amount_subunits, converted_amount_currency, converted_amount_subunits,
         metadata, created_at, updated_at)
      VALUES (5, 27, contact_id, event_time, 'USD', recorded_dollars[array_index] * 10000,
        'USD', recorded_dollars[array_index] * 10000,
        jsonb_build_object('editorial_fixture', fixture_tag, 'synthetic', true,
          'day_offset', day_offset, 'rising_trend_refinement', true), now(), now())
      RETURNING id INTO fixture_event_id;

      INSERT INTO attribution_revenues
        (business_id, event_id, action_id, contact_id, tracked_at, tracked_at_date,
         amount_subunits, amount_currency, converted_amount_subunits,
         converted_amount_currency, state, audit, created_at, updated_at)
      VALUES (5, fixture_event_id, 27, contact_id, event_time, business_today - day_offset,
        attributed_dollars[array_index] * 10000, 'USD', attributed_dollars[array_index] * 10000,
        'USD', 'active', jsonb_build_object('editorial_fixture', fixture_tag,
          'synthetic', true, 'not_a_real_attribution_run', true,
          'rising_trend_refinement', true), now(), now())
      RETURNING id INTO attributed_id;

      INSERT INTO track_revenues
        (business_id, contact_id, event_id, action_id, tracked_at, tracked_at_date,
         amount_subunits, amount_currency, converted_amount_subunits,
         converted_amount_currency, attribution_revenue_id, created_at, updated_at)
      VALUES (5, contact_id, fixture_event_id, 27, event_time, business_today - day_offset,
        recorded_dollars[array_index] * 10000, 'USD', recorded_dollars[array_index] * 10000,
        'USD', attributed_id, now(), now())
      RETURNING id INTO revenue_id;

      INSERT INTO attribution_allocations
        (business_id, attribution_revenue_id, track_revenue_id,
         amount_subunits, amount_currency, converted_amount_subunits,
         converted_amount_currency, audit, created_at, updated_at)
      VALUES (5, attributed_id, revenue_id, attributed_dollars[array_index] * 10000,
        'USD', attributed_dollars[array_index] * 10000, 'USD',
        jsonb_build_object('editorial_fixture', fixture_tag, 'synthetic', true,
          'rising_trend_refinement', true), now(), now());
    END IF;
  END LOOP;

  -- Keep the four funnel rows legible and consistent with 14 recorded orders.
  UPDATE dashboard_metrics SET count = CASE (business_today - (bucket AT TIME ZONE 'America/Montevideo')::date)
      WHEN 12 THEN 8 WHEN 8 THEN 8 WHEN 4 THEN 9 WHEN 1 THEN 10 END,
      updated_at = now()
  WHERE business_id = 5 AND action_id = 23;
  UPDATE dashboard_metrics SET count = CASE (business_today - (bucket AT TIME ZONE 'America/Montevideo')::date)
      WHEN 12 THEN 4 WHEN 8 THEN 5 WHEN 4 THEN 5 WHEN 1 THEN 6 END,
      updated_at = now()
  WHERE business_id = 5 AND action_id = 26;

  IF (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> 14
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> 14
      OR (SELECT sum(amount_subunits) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 27) <> 10000000
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 23) <> 35
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 26) <> 20
      OR (SELECT count(*) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
        AND bucket >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 14
      OR (SELECT sum(count) FROM dashboard_metrics WHERE business_id = 5 AND action_id = 54
        AND bucket >= (business_today - 13)::timestamp AT TIME ZONE 'America/Montevideo') <> 30
      OR (SELECT count(*) FROM attribution_revenues WHERE business_id = 5
        AND audit->>'editorial_fixture' = fixture_tag
        AND tracked_at_date >= business_today - 13) <> 14
      OR (SELECT sum(converted_amount_subunits) FROM attribution_revenues
        WHERE business_id = 5 AND audit->>'editorial_fixture' = fixture_tag
          AND tracked_at_date >= business_today - 13) <> 2800000
      OR (SELECT sum(revenue.converted_amount_subunits) FROM track_revenues AS revenue
        JOIN track_events AS event ON event.id = revenue.event_id
        WHERE event.business_id = 5 AND event.metadata->>'editorial_fixture' = fixture_tag
          AND revenue.tracked_at_date >= business_today - 13) <> 10000000 THEN
    RAISE EXCEPTION 'Refined Dashboard values do not match the planned illustration';
  END IF;
END;
$fixture$;

COMMIT;
