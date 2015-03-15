class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    logger = Logger.new(STDOUT)
    if user
      session[:user_id] = user.id
      logger.debug "All OK, SESSION VARIABLE: #{session.inspect}"
      redirect_to root_url, :notice => "Logged in!"
    else
      logger.debug "User in session controller not found"
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    logger = Logger.new(STDOUT)
    logger.debug "Logged out!"
    redirect_to root_url, :notice => "Logged out!"
  end
end
