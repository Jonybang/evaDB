class SocnetLinksController < ApplicationController

  private

    def socnet_link_params
      params.require(:socnet_link).permit(:url, :note, :link_parent_id, :socnet)
    end
end

