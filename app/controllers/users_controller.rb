# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    # Check there is no value in the visually hidden honeypot form field `password_confirm`.
    return head :bad_request unless params[:password_confirm].blank?

    @user = User.new(
      params.require(:user).permit(:email, :display_name, :password)
    )

    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('.welcome')
    else
      render :new
    end
  end
end
