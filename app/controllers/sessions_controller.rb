class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_back fallback_location: root_path, allow_other_host: false
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
