class SocnetsController < InheritedResources::Base

  private

    def socnet_params
      params.require(:socnet).permit!
    end
end

