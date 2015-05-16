<<<<<<< HEAD
object @contact
attributes :id, :name

child(:user) { attributes :id, :name }

child :project_tasks do
  attributes :id, :name
end

child :chief_projects do
    attributes :id, :name
=======
object @contact
attributes :id, :name

child(:user) { attributes :id, :name }

child :project_tasks do
  attributes :id, :name
end

child :chief_projects do
    attributes :id, :name
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
end