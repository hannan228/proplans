# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages, id: :uuid do |t|
      t.integer :package_type
      t.string :name
      t.integer :price
      t.string :detail
      t.string :description
      t.integer :validity
      t.string :subscription_code
      t.string :area

      t.timestamps
    end
  end
end
