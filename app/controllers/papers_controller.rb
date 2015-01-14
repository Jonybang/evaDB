class PapersController < InheritedResources::Base

  private

    def paper_params
      params.require(:paper).permit!
    end
end

