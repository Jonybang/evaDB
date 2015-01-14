class UniversitiesController < InheritedResources::Base

  private

    def university_params
      params.require(:university).permit!
    end
end

