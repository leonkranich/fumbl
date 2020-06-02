class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :instruments
  has_many :genres
  has_many :vouchers_as_teacher, source: :vouchers, foreign_key: :teacher_id
  has_many :vouchers_as_student, source: :vouchers, foreign_key: :student_id
  has_many :availabilities
  has_many :timeslots, through: :availabilities
  has_many :timeslots_as_student, source: :timeslots, foreign_key: :student_id
  has_many :homeworks, through: :timeslots

end
