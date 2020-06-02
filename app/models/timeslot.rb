class Timeslot < ApplicationRecord
  belongs_to :availability
  belongs_to :student, class_name: "User"
end
