<<<<<<< HEAD
class ProjectStatusesController < ApplicationController

  private

    def project_status_params
      params.require(:project_status).permit!
    end
end

=======
class ProjectStatusesController < ApplicationController

  private

    def project_status_params
      params.require(:project_status).permit!
    end
end

>>>>>>> 5ab5a8da4ba00a34ea1da0744f2d7980a5694bda
