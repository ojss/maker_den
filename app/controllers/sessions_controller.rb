class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

  # DOC: This function creates a new session on the server ie: logs people in
  def create
    strong_params = user_params_login
    user = User.find_by(email: strong_params[:email])
    # debugger
    if user && user.authenticate(strong_params[:password])
      log_in user
      strong_params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = "There is a problem with your credentials"
      render 'new'
    end

  end

  # DOC: Logs a user out of their session.
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  # Ensures that only the required params are permitted, so that no invalid parameter not belonging to the form in passed
  def user_params_login
    strong_params = params.require(:session).permit(:email, :password, :remember_me)
  end
end
