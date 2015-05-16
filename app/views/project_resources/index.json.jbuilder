<<<<<<< HEAD
json.array!(@project_resources) do |project_resource|
  json.extract! project_resource, :id, :name, :default_value
  json.url project_resource_url(project_resource, format: :json)
end
=======
json.array!(@project_resources) do |project_resource|
  json.extract! project_resource, :id, :name, :default_value
  json.url project_resource_url(project_resource, format: :json)
end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
