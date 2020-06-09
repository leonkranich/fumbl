class Instrument < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]
  # include PgSearch::Model
  # pg_search_scope :search, against: [ :name ],
  # associated_against: {
  #     user: [ :address ]
  #   },
  #   using: {
  #     tsearch: { prefix: true }
  # }

  belongs_to :user

  validates :user_id, presence: true
  validates :experience, length: { minimum: 30 }
  validates :years_of_experience, numericality: { greater_than: 0 }
end
