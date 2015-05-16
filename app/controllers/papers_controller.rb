class PapersController < ApplicationController

  private

    def paper_params
      params.require(:paper).permit!
    end
end

