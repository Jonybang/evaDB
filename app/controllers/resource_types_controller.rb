<<<<<<< HEAD
class ResourceTypesController < ApplicationController

  private

    def resource_type_params
      params.require(:resource_type).permit!
      #params.require(:resource_type).permit(:name, :resources_id)
    end

end
=======
class ResourceTypesController < ApplicationController

  private

    def resource_type_params
      params.require(:resource_type).permit!
      #params.require(:resource_type).permit(:name, :resources_id)
    end

end
>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
