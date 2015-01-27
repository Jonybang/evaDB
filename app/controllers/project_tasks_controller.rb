class ProjectTasksController < InheritedResources::Base

  private

    def project_task_params
      params.require(:project_task).permit!
    end
end

