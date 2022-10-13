# frozen_string_literal: true

class CreateCommentReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :comment_replies, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :comment, null: false, foreign_key: true, type: :uuid
      t.string :reply

      t.timestamps
    end
  end
end
