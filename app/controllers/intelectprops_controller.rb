class IntelectpropsController < InheritedResources::Base

  private

    def intelectprop_params
      params.require(:intelectprop).permit!
    end
end

