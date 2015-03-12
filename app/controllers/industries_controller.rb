class IndustriesController < ApplicationController

  private

    def industry_params
      params.require(:industry).permit!
    end
end

