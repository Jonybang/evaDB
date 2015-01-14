class ProjectstatusesController < InheritedResources::Base

  private

    def projectstatus_params
      params.require(:projectstatus).permit!
    end
end

