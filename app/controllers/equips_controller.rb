class EquipsController < ApplicationController

  private

    def equip_params
      params.require(:equip).permit!
    end
end

