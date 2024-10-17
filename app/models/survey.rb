class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :responses, through: :questions, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validates :user, presence: true

  def end_date_after_start_date
    if start_date.present? && end_date.present? && end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
