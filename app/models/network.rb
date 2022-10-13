# frozen_string_literal: true

class Network < ApplicationRecord
  has_many :packages
  belongs_to :user

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
end
