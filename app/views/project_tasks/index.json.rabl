collection @project_tasks

attributes :id, :name, :number, :begin_date, :end_date, :tehnical_task

child(:project_status) { attributes :id, :name, :color }
child :responsible => :contact do
    attributes :id, :name
end
