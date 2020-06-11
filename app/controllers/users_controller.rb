class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # Check there is no value in the visually hidden honeypot form field `password_confirm`.
    return head :bad_request unless params[:password_confirm].blank?

    @user = User.new(user_params)

    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome to Pine!"
    else
      render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :display_name, :password)
    end
end
