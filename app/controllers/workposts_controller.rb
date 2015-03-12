class WorkpostsController < ApplicationController

  private

    def workpost_params
      params.require(:workpost).permit!
    end
end

