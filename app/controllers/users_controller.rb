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
      flash.now[:alert] = "Signup failed"
      render "new", flash: { error: 'Sorry, something went wrong' }
    end
  end

  def edit 
  end

  def update
  end

  def delete
  end

  def forgot_password
  end

  def forgot_password_extend
    if !User.find_by_email( params[:email] ).blank?
      random_password = SecureRandom.hex(10)
      user = User.find_by_email(params[:email])
      user.generate_password_token!(random_password)

      UserMailer.forgot_password(user.email, user.name, random_password).deliver_now!
      flash[:success] = "Email is sent successfully"
      redirect_to reset_password_path
    else
      flash[:error] = "Email address not found. Please check and try again."
      redirect_to forgot_password_path
    end
  end

  def reset_password
  end

  def reset_password_extend
    token = params[:token].to_s

    if token.blank?
      flash[:error] = "Token is empty."
      redirect_to reset_password_path
      return
    end

    user = User.find_by(reset_password_token: token)
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:password])
        flash[:success] = "Password is saved successfully"
        redirect_to new_user_session_path
      else
        flash[:alert] = user.errors.full_messages.to_sentence
        redirect_to reset_password_path
      end
    else
      # redirect_to TODO
      flash[:error] = "Token not valid or expired. Try generating a new Token."
      redirect_to reset_password_path
      # render json: {error:  ['Token not valid or expired. Try generating a new Token.']}, status: :not_found
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
