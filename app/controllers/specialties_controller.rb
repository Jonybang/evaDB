class SpecialtiesController < InheritedResources::Base

  private

    def specialty_params
      params.require(:specialty).permit!
    end
end

