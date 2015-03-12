class PartnersController < ApplicationController

  private

    def partner_params
      params.require(:partner).permit!
    end
end

