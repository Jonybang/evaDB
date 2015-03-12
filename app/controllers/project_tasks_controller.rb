class ProjectTasksController < ApplicationController
   before_filter :load_parent
   def index
      @project_tasks = @parent.project_tasks.all
      index!
   end
   def destroy
     project_task = @parent.project_tasks.find(params[:id])
     project_task.destroy

     redirect_to request.referrer # will redirect back to the referrer (page from where you came from)
   end
  private

    def project_task_params
      params.require(:project_task).permit!
    end
    def load_parent
      @parent = Project.find(params[:project_id])
    end
end

