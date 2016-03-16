class UsersController < ApplicationController
  # Renders the new.html.erb view.
  def new
    # Creating a instance variable of type User(see the model)
    @user = User.new
  end

  def create
    # Creates new user in the database
    @user = User.create(user_params)
    if @user.save # User is saved in this statement, @user.save returns true if save successful
      flash[:success] = "Your account has been created"
      redirect_to root_url
      # TODO send the user to his/page
      #   TODO work on account activations
    else
      flash.now[:danger] = "There was a problem"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
      # debugger
  end

  private
  def user_params
    # Permits only the valid form parameters to be used
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
