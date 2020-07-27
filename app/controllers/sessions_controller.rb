class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    if logged_in?
      redirect_to root_path
    end

    @user = User.new
  end

  def create
    login = params.require(:user).permit(:email, :password)

    # Check there is no value in the visually hidden honeypot form field `username`.
    return head :bad_request unless params[:username].blank?

    @user = User.find_by(email: login[:email])

    if @user && @user.authenticate(login[:password])
      reset_session
      session[:user_id] = @user.id
      redirect_back fallback_location: root_path, allow_other_host: false
    else
      redirect_to login_path, alert: "Sorry, those were invalid credentials. Please try again."
    end
  end

  def destroy
    reset_session
    session[:user_id] = nil
    redirect_to root_path
  end
end
