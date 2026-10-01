load '/private/tmp/hellotext-teams-inbox-capacity-editorial-20261001/fixture-readonly.rb'
b=Business.find(5)
raise 'Wrong DB' unless ActiveRecord::Base.connection_db_config.database == 'hellotext_editorial_workload_20260928'
puts({rules:b.sla_rules.order(:id).map{|r|{id:r.id,public:r.hashed_id,kind:r.kind,name:r.name,technology_id:r.technology_id,first:r.first_response_target_seconds,ongoing:r.ongoing_response_target_seconds,discarded_at:r.discarded_at}},weekdays:b.weekdays.order(:day_of_week).map{|d|{day:d.day_of_week,open:d.open,opens:d.opens_at_minutes,closes:d.closes_at_minutes}},timezone:b.timezone,sla_cycles:SLA::Cycle.where(business:b).group(:kind,:state).count,plan_sla:b.active_quota.features.create_sla_rule?,hours_available:b.business_hours_available?}.to_json)
