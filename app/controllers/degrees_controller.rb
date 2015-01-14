class DegreesController < InheritedResources::Base

  private

    def degree_params
      params.require(:degree).permit!
    end
end

