# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params['email']).try(:authenticate, params['password'])

    if user
      session[:user_id] = user.id
      redirect_to packages_path, flash: { notice: 'Successfully logged in.' }
    else
      redirect_to new_user_session_path, flash: { alert: 'email/password is not correct' }
    end
  end

  def logged_in; end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'You have successfully logged out.'
    redirect_to packages_path
  end
end
