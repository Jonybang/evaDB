class OrganizationsController < ApplicationController
  private

    def organization_params
      params.require(:organization).permit!
    end
end

