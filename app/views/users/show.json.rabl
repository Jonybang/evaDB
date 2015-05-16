<<<<<<< HEAD
object @user
attributes :id, :email

child :contact do
  attributes :id, :name
  child :project_tasks do
    attributes :id, :name
  end
  child :skills do
    attributes :id, :name
  end
  child :team_projects do
    attributes :id, :name
  end
=======
object @user
attributes :id, :email

child :contact do
  attributes :id, :name
  child :project_tasks do
    attributes :id, :name
  end
  child :skills do
    attributes :id, :name
  end
  child :team_projects do
    attributes :id, :name
  end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
end