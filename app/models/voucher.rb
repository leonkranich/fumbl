class Voucher < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :counter, numericality: { greater_than: 0 }
  validates :teacher_id, presence: true
  validates :student_id, presence: true
end
