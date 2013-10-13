class TaskRunner

  @queue = :task_runner_queue

  def self.perform(tenant_id, project_id, entity_id, entity_type, task_name, task_run_set_id, options)
    
    Tenant.current = Tenant.find tenant_id
    Project.current = Project.find project_id

    entity = Entities::Base.find(entity_id) #eval(entity_type).where(:id => entity_id).first
    entity.run_task(task_name, task_run_set_id, options)

    Tenant.current = nil
    Project.current = nil
  end

  def term_timeout(timeout=600)
    @term_timeout=timeout
  end


end