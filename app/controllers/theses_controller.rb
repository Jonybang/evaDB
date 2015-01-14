class ThesesController < InheritedResources::Base

  private

    def these_params
      params.require(:these).permit!
    end
end

