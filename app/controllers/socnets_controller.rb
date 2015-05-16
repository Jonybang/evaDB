class SocnetsController < ApplicationController

  private

    def socnet_params
      params.require(:socnet).permit!
    end
end

