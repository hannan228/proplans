# frozen_string_literal: true

class EnableExtensionForUuid < ActiveRecord::Migration[7.0]
  def change
    # UUID Primary Key in Rails 6 with PostgreSQL and Active Record
    # https://pawelurbanek.com/uuid-order-rails
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  end
end
