class ThesesController < ApplicationController

  private

    def these_params
      params.require(:these).permit!
    end
end

