class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question

  #validarions
  validates_presence_of :answer
end
