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
    logger = Logger.new(STDOUT)
    logger.debug "==================================Check if session empty============================"
    if (!session || !session[:user_id])
      logger.debug "==================================Session EMPTY============================"
      return
    end
    logger.debug "==================================Session not empty============================"
    user_id = session[:user_id]["$oid"] || session[:user_id]
    @current_user ||= User.find_by(id: user_id) if user_id
  end
end
