class Instrument < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :experience, length: { minimum: 30 }
  validates :years_of_experience, numericality: { greater_than: 0 }
end
