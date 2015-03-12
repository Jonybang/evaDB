class RanksController < ApplicationController

  private

    def rank_params
      params.require(:rank).permit!
    end
end

