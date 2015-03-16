object @project
attributes :id, :name, :description, :result

child(:project_status) { attributes :id, :name }
child(:project_direction) { attributes :id, :name }
child(:chief) { attributes :id, :name }

child :project_tasks do
  attributes :id, :name
end
child :team do
  attributes :id, :name
end
child :resources do
  attributes :id, :value
  child :resource_type do
    attributes :id, :name
  end
  child :owner do
    attributes :id, :name
  end
end