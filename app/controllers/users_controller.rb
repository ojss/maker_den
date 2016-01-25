class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash.now[:success] = "Your account has been created"
      render 'new'
      # TODO send the user to his/page
    else
      flash.now[:danger] = "There was a problem"
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
