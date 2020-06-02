class Availability < ApplicationRecord
  belongs_to :teacher, class_name: "User"

  validates :teacher_id, presence: true
end
