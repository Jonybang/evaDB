class EquipStatusesController < InheritedResources::Base

  private

    def equip_status_params
      params.require(:equip_status).permit!
    end
end

