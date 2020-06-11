class Timeslot < ApplicationRecord
  belongs_to :availability
  belongs_to :student, class_name: "User"

  has_many  :homeworks, dependent: :destroy

  #validates :student_id, presence: true
  validates :availability_id, presence: true
  validates :start_time, :end_time, presence: true
  # validates :end_time_after_start_time

  # private

  # def end_time_after_start_date
  #   return if end_time.blank? || start_time.blank?

  #   if end_time < start_time
  #     errors.add(:end_time, "must be after the start time")
  #   end
  # end
end
