# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.forgot_password.subject
  #
  def forgot_password(email_to, name, token)
    @user_name = name
    @token = token
    @email = email_to

    mail(to: email_to, subject: 'Bundle - Password Reset Token')
  end
end
