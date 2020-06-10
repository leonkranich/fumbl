class Instrument < ApplicationRecord
  # include PgSearch::Model
  # pg_search_scope :search_by_name,
  #   against: [ :name ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
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
