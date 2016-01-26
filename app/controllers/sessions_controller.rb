class SessionsController < ApplicationController
  include SessionsHelper

  def new

  end

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

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def user_params_login
    strong_params = params.require(:session).permit(:email, :password, :remember_me)
  end
end
