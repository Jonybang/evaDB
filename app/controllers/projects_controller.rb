class ProjectsController < InheritedResources::Base

  private

    def project_params
      params.require(:project).permit!
    end
end

