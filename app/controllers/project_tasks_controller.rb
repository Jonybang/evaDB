class ProjectTasksController < ApplicationController
   before_filter :load_parent
   def index
      @project_tasks = @parent.project_tasks.all
      index!
   end
   def edit
     @project_task = @parent.project_tasks.find(params[:id])
     edit!
   end
   def update
     update! do |success, failure|
       success.html { redirect_to project_project_task_path(@project_task.project, @project_task) }
       failure.html { redirect_to root_path() }
     end
   end
   def destroy
     project_task = @parent.project_tasks.find(params[:id])
     project_task.destroy

     redirect_to request.referrer # will redirect back to the referrer (page from where you came from)
   end
   helper_method :project_tasks_path
  private

    def project_tasks_path
      return @parent
    end
    def project_task_params
      params.require(:project_task).permit!
    end
    def load_parent
      @parent = Project.find(params[:project_id])
    end
end

