object @contact
attributes :id, :name

child(:user) { attributes :id, :name }

child :project_tasks do
  attributes :id, :name
end

child :chief_projects do
    attributes :id, :name
end