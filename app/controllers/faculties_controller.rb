class FacultiesController < InheritedResources::Base

  private

    def faculty_params
      params.require(:faculty).permit!
    end
end

