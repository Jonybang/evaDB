class IntellectPropertiesController < InheritedResources::Base

  private

    def intellect_property_params
      params.require(:intellect_property).permit!
    end
end

