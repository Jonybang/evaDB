class IntelecttypesController < InheritedResources::Base

  private

    def intelecttype_params
      params.require(:intelecttype).permit!
    end
end

