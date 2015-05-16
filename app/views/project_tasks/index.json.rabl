<<<<<<< HEAD
collection @project_tasks

attributes :id, :name, :number, :begin_date, :end_date, :tehnical_task

child(:project_status) { attributes :id, :name, :color }
child :responsible => :contact do
    attributes :id, :name
end
=======
collection @project_tasks

attributes :id, :name, :number, :begin_date, :end_date, :tehnical_task

child(:project_status) { attributes :id, :name, :color }
child :responsible => :contact do
    attributes :id, :name
end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
