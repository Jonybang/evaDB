class WorkpostsController < InheritedResources::Base

  private

    def workpost_params
      params.require(:workpost).permit!
    end
end

