class DegreesController < ApplicationController

  private

    def degree_params
      params.require(:degree).permit!
    end
end

