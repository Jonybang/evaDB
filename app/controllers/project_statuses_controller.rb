class ProjectStatusesController < InheritedResources::Base

  private

    def project_status_params
      params.require(:project_status).permit!
    end
end

