class ProjectDirectionsController < InheritedResources::Base

  private

    def project_direction_params
      params.require(:project_direction).permit!
    end
end

