class LinksController < ApplicationController

  private

    def link_params
      params.require(:link).permit!
    end
end

