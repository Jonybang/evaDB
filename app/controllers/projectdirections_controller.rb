class ProjectdirectionsController < InheritedResources::Base

  private

    def projectdirection_params
      params.require(:projectdirection).permit!
    end
end

