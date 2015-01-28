class FinanceSourcesController < InheritedResources::Base

  private

    def finance_source_params
      params.require(:finance_source).permit(:name, :contact_data_id, :link_id, :volume_from, :volume_to, :currency_id, :projects_id, :project_directions_id)
    end
end

