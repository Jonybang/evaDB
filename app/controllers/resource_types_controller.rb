class ResourceTypesController < ApplicationController

  private

    def resource_type_params
      params.require(:resource_type).permit!
      #params.require(:resource_type).permit(:name, :resources_id)
    end

end
