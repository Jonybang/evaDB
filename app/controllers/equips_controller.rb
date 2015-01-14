class EquipsController < InheritedResources::Base

  private

    def equip_params
      params.require(:equip).permit!
    end
end

