class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :json, :html
  protect_from_forgery with: :exception
  inherit_resources
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender

  helper_method :current_user

  private

  def current_user
    logger = Logger.new(STDOUT)
    logger.debug "Get current user, session: #{session.inspect}"
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
