# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to packages_path, notice: 'You have successfully Logged-In'
    else
      render 'new', flash: { error: @user.errors.full_messages.to_sentence }
    end
  end

  def edit; end

  def update; end

  def delete; end

  def forgot_password; end

  def forgot_password_extend
    if User.find_by_email(params[:email]).blank?
      redirect_to forgot_password_path, flash: { error: 'Email address not found. Please check and try again.' }
    else
      random_password = SecureRandom.hex(10)
      user = User.find_by_email(params[:email])
      user.generate_password_token!(random_password)

      UserMailer.forgot_password(user.email, user.name, random_password).deliver_now!
      redirect_to reset_password_path, flash: { success: 'Email is sent successfully' }
    end
  end

  def reset_password; end

  def reset_password_extend
    token = params[:token].to_s
    if token.blank?
      redirect_to reset_password_path, flash: { error: 'Token is empty.' }
      return
    end

    user = User.find_by(reset_password_token: token)
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        redirect_to new_user_session_path, flash: { success: 'Password is saved successfully' }
      else
        redirect_to reset_password_path, flash: { alert: user.errors.full_messages.to_sentence }
      end
    else
      redirect_to reset_password_path, flash: { error: 'Token not valid or expired. Try generating a new Token.' }
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
