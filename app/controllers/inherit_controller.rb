class InheritController < InheritedResources::Base
   respond_to :html, :xml, :json
   actions :all#, :except => [ :destroy]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
