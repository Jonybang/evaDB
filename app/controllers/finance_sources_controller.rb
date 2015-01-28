class FinanceSourcesController < InheritedResources::Base

  private

    def finance_source_params
      params.require(:finance_source).permit!
    end
end

