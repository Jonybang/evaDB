class ScientistsController < InheritedResources::Base

  private

    def scientist_params
      params.require(:scientist).permit!
    end
end

