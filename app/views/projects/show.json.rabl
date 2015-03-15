object @project
attributes :id, :name, :description, :result

child(:project_status) { attributes :id, :name }
child(:project_direction) { attributes :id, :name }
child(:chief) { attributes :id, :name }

child :project_tasks do
  attributes :id, :name
end