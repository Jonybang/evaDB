class RoomsController < ApplicationController

  private

    def room_params
      params.require(:room).permit!
    end
end

