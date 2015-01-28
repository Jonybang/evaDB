json.array!(@project_statuses) do |project_status|
  json.extract! project_status, :id, :name, :projects_id
  json.url project_status_url(project_status, format: :json)
end
