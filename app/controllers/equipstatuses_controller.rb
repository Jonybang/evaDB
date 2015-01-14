class EquipstatusesController < InheritedResources::Base

  private

    def equipstatus_params
      params.require(:equipstatus).permit!
    end
end

