json.array!(@project_resources) do |project_resource|
  json.extract! project_resource, :id, :name, :default_value
  json.url project_resource_url(project_resource, format: :json)
end
