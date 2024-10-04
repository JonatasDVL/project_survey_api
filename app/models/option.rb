class Option < ApplicationRecord
  belongs_to :question

  validates :text, presence: true, length: { minimum: 6 }
  validates :question, presence: true
end
