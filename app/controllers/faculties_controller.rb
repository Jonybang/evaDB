class FacultiesController < ApplicationController

  private

    def faculty_params
      params.require(:faculty).permit!
    end
end

