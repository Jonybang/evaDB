class UniversitiesController < ApplicationController

  private

    def university_params
      params.require(:university).permit!
    end
end

