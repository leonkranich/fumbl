class Availability < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  has_many :timeslots

  validates :teacher_id, presence: true
end
