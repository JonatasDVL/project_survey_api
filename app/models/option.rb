class Option < ApplicationRecord
  belongs_to :question
  has_many :responses, foreign_key: 'selected_option_id', dependent: :destroy


  validates :text, presence: true, length: { minimum: 6 }
  validates :question, presence: true
end
