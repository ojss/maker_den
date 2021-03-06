module SessionsHelper
  # Creates a new session for the given user
  # session is an inbuilt feature of rails so is cookies

  # !!!!!!!   DO NOT TOUCH ANY OF THE CODE BELOW    !!!!!!!!!!!!!
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the user and deletes the cookie by calling forget
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end


  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def current_user?(user)
    user == current_user
  end


  def remember(user)
    #   Remembers user in a persistent system
    user.remember
    # cookies[:users_id] = {value: user.id, expires: 20.years.from_now.utc}
    # equivalently:
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # The function that actually deletes the cookie from the browser.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end


  # If no current_user is nil then no one is logged in which means the .nil? method returns true
  # Negated because we are asking 'Is the user logged_in?', wont cause confusion later.
  def logged_in?
    !current_user.nil?
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

end
