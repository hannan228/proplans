# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :package

  has_many :comment_replies

  # validarions
  validates_presence_of :title
  validates_uniqueness_of :title
end
