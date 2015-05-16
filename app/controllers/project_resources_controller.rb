<<<<<<< HEAD
class ProjectResourcesController < ApplicationController

  private

    def project_resource_params
      params.require(:project_resource).permit!
      #params.require(:project_resource).permit(:name, :default_value)
    end

end
=======
class ProjectResourcesController < ApplicationController

  private

    def project_resource_params
      params.require(:project_resource).permit!
      #params.require(:project_resource).permit(:name, :default_value)
    end

end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
