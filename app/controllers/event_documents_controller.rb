class EventDocumentsController < ApplicationController

  private

    def event_document_params
      params.require(:event_document).permit!
    end
end

