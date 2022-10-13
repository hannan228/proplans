# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  belongs_to :package

  has_many :answers

  # validarions
  validates_presence_of :title
  validates_uniqueness_of :title
end
