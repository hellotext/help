# One-time, callback-free refinement of the isolated Workload screenshot clone.
# Run with bin/rails runner from the Rails checkout. Dry-run is the default;
# EDITORIAL_REFINEMENT_APPLY=YES_ISOLATED_DEMO_ONLY is required to write.

class EditorialWorkloadVisualRefinement
  DATABASE = 'hellotext_editorial_workload_20260928'
  BUSINESS_ID = 5
  PREFIX = 'editorial_workload_20260928_'
  APPLY_TOKEN = 'YES_ISOLATED_DEMO_ONLY'
  DAYS = (Date.new(2026, 9, 11)..Date.new(2026, 9, 24)).to_a
  OLD_DAYS = [Date.new(2026, 9, 12), Date.new(2026, 9, 17), Date.new(2026, 9, 23)]
  SESSION_MINUTES = [72, 88, 68, 84, 76, 80, 72, 92, 72, 80, 76, 84, 68, 68]
  KEYS = { high: %w[high_0 high_1], watch: %w[watch_0] }

  def run
    guard_environment
    ApplicationRecord.transaction do
      guard_business_and_identity
      state = period_sessions(:high).size == DAYS.size ? :refined : :original
      if state == :refined
        guard_refined
        guard_expected_report(report_snapshot)
        puts "already_refined=true database=#{DATABASE} period=#{DAYS.first}..#{DAYS.last}"
        next
      end

      guard_original
      before = report_snapshot
      guard_expected_report(before)
      puts "preflight=ok database=#{DATABASE} business_id=#{BUSINESS_ID} period=#{DAYS.first}..#{DAYS.last} source_sessions=34 source_handles=37 planned_sessions=56 planned_handles=70"
      unless ENV['EDITORIAL_REFINEMENT_APPLY'] == APPLY_TOKEN
        puts "dry_run=true; set EDITORIAL_REFINEMENT_APPLY=#{APPLY_TOKEN} only for this guarded clone"
        next
      end

      refine_workload
      refine_ownership
      guard_refined
      after = report_snapshot
      raise "Period report changed: #{before.inspect} != #{after.inspect}" unless after == before
      puts "applied=true database=#{DATABASE} selected_period_sessions=56 selected_period_handles=70 unchanged_report=#{after.inspect}"
    end
  end

  private

  def guard_environment
    @db = ActiveRecord::Base.connection
    raise 'Development only' unless Rails.env.development?
    raise 'Wrong configured database' unless ActiveRecord::Base.connection_db_config.database == DATABASE
    raise 'Wrong active database' unless @db.select_value('SELECT current_database()') == DATABASE
    address = @db.select_value('SELECT inet_server_addr()::text')
    raise 'Database is not local' unless address.nil? || %w[127.0.0.1 ::1].include?(address)
    raise 'Report widget samples must be disabled' unless ENV['REPORT_WIDGET_SAMPLES'] == '0'
    raise 'Selected period is not complete' unless Date.current > DAYS.last
  end

  def guard_business_and_identity
    @business = Business.find(BUSINESS_ID)
    raise 'Wrong demonstration business' unless @business.handle == 'hellotext' && @business.name == 'Enterprise'
    raise 'Wrong business state' unless @business.kept? && @business.state == 'active'
    raise 'Wrong timezone or sample mode' unless @business.timezone == 'Montevideo' && @business.metadata['report_development_samples'] == false
    @zone = Time.find_zone!(@business.timezone)
    @period = local(DAYS.first)...local(DAYS.last + 1.day)

    source_contacts = Contact.where(business_id: BUSINESS_ID)
      .where('metadata @> ?', { design_system_report_fixture: true }.to_json)
      .where("COALESCE(metadata ->> 'fixture_key', '') NOT LIKE ?", "#{PREFIX}%")
    raise 'Source contact population changed' unless source_contacts.count == 116 && source_contacts.where(subscription_state: :unconfirmed, messageable: false).count == 116
    contacts = fixture_scope(Contact)
    raise 'Fixture contacts changed or became deliverable' unless contacts.count == 11 && contacts.where(subscription_state: :unconfirmed, messageable: false).count == 11
    raise 'Unexpected total contact population' unless Contact.where(business_id: BUSINESS_ID).count == 127
    raise 'An automation is active' if Automation::Workflow.where(business_id: BUSINESS_ID).where.not(state: 'disabled').exists?
    raise 'A channel is active' if Channel.where(business_id: BUSINESS_ID).where.not(status: 'inactive').exists?
    raise 'A playbook is enabled' if Playbook.where(business_id: BUSINESS_ID, enabled: true).exists?

    @users = %i[low_a low_b high watch].to_h do |key|
      [key, User.find_by!(email: "#{PREFIX}#{key}@example.test")]
    end
    raise 'Unexpected fixture users' unless User.where('email LIKE ?', "#{PREFIX}%@example.test").count == 4
    @privileges = @users.transform_values do |user|
      Privilege.where(business_id: BUSINESS_ID, user_id: user.id, discarded_at: nil).sole
    end
    raise 'Fixture privileges changed' unless @privileges.values.map(&:max_concurrent_conversations) == [3, 3, 2, 2]
    @teams = { high: Team.kept.where(business_id: BUSINESS_ID, name: 'Ventas demo').sole,
               watch: Team.kept.where(business_id: BUSINESS_ID, name: 'Atención demo').sole }
    @conversations = %w[high_0 high_1 watch_0].to_h do |key|
      [key, fixture_scope(Conversation).where(metadata: { design_system_report_fixture: true, fixture_key: "#{PREFIX}conversation_#{key}" }).sole]
    end
    raise 'Fixture conversation population changed' unless fixture_scope(Conversation).count == 11
    messages = fixture_scope(Message)
    raise 'Fixture message changed' unless messages.count == 1 && messages.where(state: :received, destination_id: nil, dispatched_at: nil).count == 1 && messages.first.body.blank?
    raise 'Fixture SLA cycle changed' unless SLA::Cycle.where(business_id: BUSINESS_ID, conversation_id: @conversations.fetch('high_0').id, state: 'breached', responded_at: nil).count == 1
    raise 'Low-work fixture changed' unless period_sessions(:low_a).count == 14 && period_sessions(:low_b).count == 14 && period_handles(:low_a).count == 14 && period_handles(:low_b).count == 14
  end

  def guard_original
    raise 'Unexpected original session count' unless period_sessions(:high).count == 3 && period_sessions(:watch).count == 3
    raise 'Unexpected original handle count' unless period_handles(:high).count == 6 && period_handles(:watch).count == 3
    @old_sessions = {}
    OLD_DAYS.each do |day|
      %i[high watch].each do |role|
        session = period_sessions(role).find { |row| row.started_at == local(day, 9) }
        raise "Missing original #{role} session on #{day}" unless session
        raise 'Original session changed' unless session.business_id == BUSINESS_ID && session.privilege_id == @privileges.fetch(role).id && session.ended_at == local(day, 15) && session.last_seen_at == session.ended_at && session.ended_reason == 'logout' && session.max_concurrent_conversations_snapshot == 2
        handles = Workload::Handle.where(workload_session_id: session.id).order(:conversation_id).to_a
        raise 'Original handles changed' unless handles.map(&:conversation_id) == KEYS.fetch(role).map { |key| @conversations.fetch(key).id }.sort
        handles.each do |handle|
          expected_end = role == :high ? local(day, 15) : local(day, 13, 30)
          raise 'Original handle changed' unless handle.business_id == BUSINESS_ID && handle.user_id == @users.fetch(role).id && handle.privilege_id == @privileges.fetch(role).id && handle.started_at == session.started_at && handle.ended_at == expected_end && handle.last_touched_at == expected_end && handle.ended_reason == 'session_ended' && handle.start_source == 'note' && handle.last_source == 'note' && handle.handle_idle_timeout_seconds_snapshot == 300
        end
        @old_sessions[[role, day]] = session
      end
    end
    guard_intervals(refined: false)
    guard_totals(refined: false)
  end

  def guard_refined
    raise 'Unexpected refined session count' unless period_sessions(:high).count == 14 && period_sessions(:watch).count == 14
    raise 'Unexpected refined handle count' unless period_handles(:high).count == 28 && period_handles(:watch).count == 14
    DAYS.zip(SESSION_MINUTES).each do |day, minutes|
      %i[high watch].each do |role|
        sessions = period_sessions(role).select { |row| row.started_at == local(day, 9) }
        raise "Missing or duplicate refined #{role} session on #{day}" unless sessions.size == 1
        session = sessions.sole
        raise 'Refined session changed' unless session.business_id == BUSINESS_ID && session.privilege_id == @privileges.fetch(role).id && session.ended_at == local(day, 9) + minutes.minutes && session.last_seen_at == session.ended_at && session.ended_reason == 'logout' && session.max_concurrent_conversations_snapshot == 2
        handles = Workload::Handle.where(workload_session_id: session.id).order(:conversation_id).to_a
        raise 'Refined handles changed' unless handles.map(&:conversation_id) == KEYS.fetch(role).map { |key| @conversations.fetch(key).id }.sort
        handles.each do |handle|
          expected_end = local(day, 9) + (role == :high ? minutes : minutes * 3 / 4).minutes
          expected_reason = role == :high ? 'session_ended' : 'idle_timeout'
          expected_touch = role == :high ? expected_end : expected_end - 5.minutes
          raise 'Refined handle changed' unless handle.business_id == BUSINESS_ID && handle.user_id == @users.fetch(role).id && handle.privilege_id == @privileges.fetch(role).id && handle.started_at == session.started_at && handle.ended_at == expected_end && handle.last_touched_at == expected_touch && handle.ended_reason == expected_reason && handle.start_source == 'note' && handle.last_source == 'note' && handle.handle_idle_timeout_seconds_snapshot == 300
        end
      end
    end
    guard_intervals(refined: true)
    guard_totals(refined: true)
  end

  def guard_intervals(refined:)
    @intervals = {}
    @conversations.each do |key, conversation|
      role = key.start_with?('high') ? :high : :watch
      expected_start = refined ? local(DAYS.first, 8, 55) : local(OLD_DAYS.first, 8, 55)
      expected_end = if key == 'high_0'
        nil
      elsif refined
        duration = role == :high ? SESSION_MINUTES.last : SESSION_MINUTES.last * 3 / 4
        local(DAYS.last, 9) + duration.minutes + 5.minutes
      elsif key == 'high_1'
        local(OLD_DAYS.last, 15, 5)
      else
        local(OLD_DAYS.last, 13, 35)
      end
      user_interval = Workload::UserInterval.where(business_id: BUSINESS_ID, conversation_id: conversation.id).sole
      team_interval = Workload::TeamInterval.where(business_id: BUSINESS_ID, conversation_id: conversation.id).sole
      raise 'Fixture ownership interval changed' unless user_interval.user_id == @users.fetch(role).id && user_interval.started_at == expected_start && user_interval.ended_at == expected_end && team_interval.team_id == @teams.fetch(role).id && team_interval.started_at == expected_start && team_interval.ended_at == expected_end
      @intervals[key] = [user_interval, team_interval]
    end
  end

  def guard_totals(refined:)
    expected_sessions = refined ? 56 : 34
    expected_handles = refined ? 70 : 37
    ids = @users.values.map(&:id)
    raise 'Unexpected period fixture totals' unless Workload::Session.where(business_id: BUSINESS_ID, user_id: ids, started_at: @period).count == expected_sessions && Workload::Handle.where(business_id: BUSINESS_ID, user_id: ids, started_at: @period).count == expected_handles
    { high: [18.hours, 36.hours], watch: [18.hours, 13.5.hours] }.each do |role, (session_total, handle_total)|
      actual_session = period_sessions(role).sum { |row| row.ended_at - row.started_at }
      actual_handle = period_handles(role).sum { |row| row.ended_at - row.started_at }
      raise "Fixture #{role} duration changed" unless actual_session == session_total && actual_handle == handle_total
    end
  end

  def refine_workload
    @now = Time.current
    DAYS.zip(SESSION_MINUTES).each do |day, minutes|
      %i[high watch].each do |role|
        start_at = local(day, 9)
        session_end = start_at + minutes.minutes
        session = @old_sessions[[role, day]]
        if session
          session.update_columns(last_seen_at: session_end, ended_at: session_end, updated_at: @now)
        else
          session = insert_one(Workload::Session,
            business_id: BUSINESS_ID, user_id: @users.fetch(role).id, privilege_id: @privileges.fetch(role).id,
            started_at: start_at, last_seen_at: session_end, ended_at: session_end, ended_reason: 'logout',
            role_snapshot: 'agent', max_concurrent_conversations_snapshot: 2,
            daily_handling_minutes_snapshot: 360, session_timeout_seconds_snapshot: 900)
        end
        KEYS.fetch(role).each do |key|
          handle_end = role == :high ? session_end : start_at + (minutes * 3 / 4).minutes
          reason = role == :high ? 'session_ended' : 'idle_timeout'
          last_touch = role == :high ? handle_end : handle_end - 5.minutes
          existing = Workload::Handle.find_by(workload_session_id: session.id, conversation_id: @conversations.fetch(key).id)
          if existing
            existing.update_columns(last_touched_at: last_touch, ended_at: handle_end, ended_reason: reason, updated_at: @now)
          else
            insert_one(Workload::Handle,
              business_id: BUSINESS_ID, user_id: @users.fetch(role).id, privilege_id: @privileges.fetch(role).id,
              conversation_id: @conversations.fetch(key).id, workload_session_id: session.id,
              started_at: start_at, last_touched_at: last_touch, ended_at: handle_end, ended_reason: reason,
              start_source: 'note', last_source: 'note', handle_idle_timeout_seconds_snapshot: 300)
          end
        end
      end
    end
  end

  def refine_ownership
    start_at = local(DAYS.first, 8, 55)
    @intervals.each do |key, rows|
      duration = key.start_with?('high') ? SESSION_MINUTES.last : SESSION_MINUTES.last * 3 / 4
      end_at = local(DAYS.last, 9) + duration.minutes + 5.minutes
      rows.each do |row|
        row.update_columns(started_at: start_at, ended_at: key == 'high_0' ? nil : end_at, updated_at: @now)
      end
    end
  end

  def report_snapshot
    report = Report.find_by!(identifier: :workload_and_capacity)
    picker = Report::DatePicker.new(params: { preset: 'custom', from: DAYS.first.iso8601, to: DAYS.last.iso8601 })
    metrics = report.metrics.to_h do |metric|
      [metric.identifier, metric.calculator(report: report, business: @business, from: picker.from, to: picker.to).run.fetch(:raw_value)]
    end
    active_load = report.metrics.find { |metric| metric.identifier == 'active_load' }
    calculator = active_load.calculator(report: report, business: @business, from: picker.from, to: picker.to)
    dataset = Report::Breakdown::WorkloadAndCapacity::Team::Dataset.new(business: @business, from: picker.from, to: picker.to, calculator: calculator)
    teams = dataset.ranked_rows(metric_identifier: 'active_load', k: 8).to_h do |row|
      [row.fetch(:breakdown_id), [row.fetch(:components).handle_seconds, row.fetch(:components).capacity_seconds]]
    end
    efficiency = dataset.send(:session_efficiency_components).transform_values { |row| [row.active_seconds, row.session_seconds] }
    pressure = Report::Section::OperationalPressure.new(business: @business, from: picker.from, to: picker.to, item: 'team').rows.to_h do |row|
      [row.object.id, [row.unanswered, row.sla_risk, row.utilization.round(6), row.concurrent.round(6), row.burn_state]]
    end
    { metrics: metrics, team_active_load: teams, team_efficiency: efficiency, team_pressure: pressure }
  end

  def guard_expected_report(snapshot)
    raise 'Unexpected source KPI' unless snapshot.fetch(:metrics).fetch('active_load') == 20.3
    raise 'Unexpected source team values' unless snapshot.fetch(:team_active_load).fetch(@teams.fetch(:high).id) == [799_710.0, 3_708_000.0] && snapshot.fetch(:team_active_load).fetch(@teams.fetch(:watch).id) == [668_010.0, 3_506_400.0]
  end

  def period_sessions(role)
    Workload::Session.where(business_id: BUSINESS_ID, user_id: @users.fetch(role).id, started_at: @period).order(:started_at).to_a
  end

  def period_handles(role)
    Workload::Handle.where(business_id: BUSINESS_ID, user_id: @users.fetch(role).id, started_at: @period).order(:started_at).to_a
  end

  def fixture_scope(model)
    model.where(business_id: BUSINESS_ID).where("metadata ->> 'fixture_key' LIKE ?", "#{PREFIX}%")
  end

  def local(day, hour = 0, minute = 0)
    @zone.local(day.year, day.month, day.day, hour, minute)
  end

  def insert_one(model, attributes)
    rows = model.insert_all!([attributes.merge(created_at: @now, updated_at: @now)], returning: %w[id]).rows
    raise "Unexpected #{model.name} insert result" unless rows.size == 1 && rows.first.size == 1
    model.find(rows.first.first)
  end
end

EditorialWorkloadVisualRefinement.new.run
