# frozen_string_literal: true

class Package < ApplicationRecord
  belongs_to :network
  belongs_to :user

  has_many :comments
  has_many :questions

  enum package_type: { call: 5, sms: 10, internet: 15, all_in_one: 20 }

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :price
  validates_presence_of :validity
  validates_presence_of :subscription_code
  validates_presence_of :detail
end
