collection @projects
attributes :id, :name, :description
child(:project_status) { attributes :id, :name }
child(:project_direction) { attributes :id, :name }
