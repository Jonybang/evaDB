class ProjectTasksController < InheritedResources::Base

  private

    def project_task_params
      params.require(:project_task).permit(:name, :number, :begin_date, :end_date, :projectstatus_id, :tehnical_task, :responsible_id, :project_id)
    end
end

