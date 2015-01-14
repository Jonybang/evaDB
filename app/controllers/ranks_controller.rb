class RanksController < InheritedResources::Base

  private

    def rank_params
      params.require(:rank).permit!
    end
end

