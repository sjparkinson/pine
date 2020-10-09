# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def edit
    fresh_when @user
  end

  def create
    # Check there is no value in the visually hidden honeypot form field `password_confirm`.
    return head :bad_request unless params[:password_confirm].blank?

    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      reset_session
      session[:user_id] = @user.id
      redirect_to root_path, notice: t('.welcome')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to account_path, notice: t('.success')
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :display_name, :password)
  end
end
