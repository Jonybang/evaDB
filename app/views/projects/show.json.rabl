<<<<<<< HEAD
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
  child :resoursable do
    attributes :id, :name
  end
=======
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
  child :resoursable do
    attributes :id, :name
  end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
end