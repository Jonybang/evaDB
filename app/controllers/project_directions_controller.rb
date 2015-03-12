class ProjectDirectionsController < ApplicationController

  private

    def project_direction_params
      params.require(:project_direction).permit!
    end
end

