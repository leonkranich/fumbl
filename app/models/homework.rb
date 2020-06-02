class Homework < ApplicationRecord
  belongs_to :timeslot

  validates :timeslot_id, presence: true
end
