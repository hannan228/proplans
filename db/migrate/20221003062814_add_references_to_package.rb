# frozen_string_literal: true

class AddReferencesToPackage < ActiveRecord::Migration[7.0]
  def change
    add_reference :packages, :network, null: false, foreign_key: true, type: :uuid
    add_reference :packages, :user, null: false, foreign_key: true, type: :uuid
  end
end
