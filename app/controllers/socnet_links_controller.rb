<<<<<<< HEAD
class SocnetLinksController < ApplicationController

  private

    def socnet_link_params
      params.require(:socnet_link).permit(:url, :note, :link_parent_id, :socnet)
    end
end

=======
class SocnetLinksController < ApplicationController

  private

    def socnet_link_params
      params.require(:socnet_link).permit(:url, :note, :link_parent_id, :socnet)
    end
end

>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
