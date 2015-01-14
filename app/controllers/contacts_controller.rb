class ContactsController < InheritedResources::Base

  private

    def contact_params
      params.require(:contact).permit!
    end
end

