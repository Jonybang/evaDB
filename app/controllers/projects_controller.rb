class ProjectsController < ApplicationController

  private

    def project_params
      params.require(:project).permit!
    end
end

