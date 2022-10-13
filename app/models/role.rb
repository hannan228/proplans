# frozen_string_literal: true

class Role < ApplicationRecord
  self.implicit_order_column = 'created_at'

  # associations
  has_many :assignments
  has_many :users, through: :assignments

  # validations
  validates :name, presence: true, uniqueness: true
end
