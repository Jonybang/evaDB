json.array!(@project_tasks) do |project_task|
  json.extract! project_task, :id, :name, :number, :begin_date, :end_date, :projectstatus_id, :tehnical_task, :responsible_id, :project_id
  json.url project_task_url(project_task, format: :json)
end
