class IntellectTypesController < ApplicationController

  private

    def intellect_type_params
      params.require(:intellect_type).permit!
    end
end

