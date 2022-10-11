class CommentReply < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  #validarions
  validates_presence_of :reply
end
