class RoomsController < InheritedResources::Base

  private

    def room_params
      params.require(:room).permit!
    end
end

