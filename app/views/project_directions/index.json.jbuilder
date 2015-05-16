json.array!(@project_directions) do |project_direction|
  json.extract! project_direction, :id, :name, :projects_id
  json.url project_direction_url(project_direction, format: :json)
end
