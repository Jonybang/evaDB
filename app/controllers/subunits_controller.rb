class SubunitsController < InheritedResources::Base

  private

    def subunit_params
      params.require(:subunit).permit!
    end
end

