class ProjectResourcesController < ApplicationController

  private

    def project_resource_params
      params.require(:project_resource).permit!
      #params.require(:project_resource).permit(:name, :default_value)
    end

end
