class SubunitsController < ApplicationController

  private

    def subunit_params
      params.require(:subunit).permit!
    end
end

