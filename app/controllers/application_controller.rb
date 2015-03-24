class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  respond_to :json, :html
  protect_from_forgery with: :exception
  inherit_resources

  helper_method :current_user

  private

  def current_user
    user_id = session[:user_id]["$oid"] || session[:user_id]
    logger = Logger.new(STDOUT)
    logger.debug "==================================Get current user, session id: #{user_id}============================"
    @current_user ||= User.find_by(id: user_id) if user_id
  end
end
