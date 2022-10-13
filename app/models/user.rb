# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # associations
  has_many :networks
  has_many :packages
  has_many :comments
  has_many :comment_replies
  has_many :questions
  has_many :answers
  has_many :assignments
  has_many :roles, through: :assignments

  # validations
  validates_presence_of :email
  validates_uniqueness_of :email

  def role?(role)
    roles.any? { |r| r.name.underscore.to_sym == role }
  end

  def generate_password_token!(token)
    self.reset_password_token = token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def password_token_valid?
    (reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    self.password_confirmation = password
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end
end
