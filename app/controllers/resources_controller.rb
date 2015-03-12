class ResourcesController < ApplicationController

  private

    def resource_params
      params.require(:resource).permit!
      #params.require(:resource).permit(:name, :default_value)
    end

end
