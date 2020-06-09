class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include PgSearch::Model
  multisearchable against: [:address],
                  if: :teacher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :instruments
  has_many :genres
  has_many :vouchers_as_teacher, source: :vouchers, foreign_key: :teacher_id
  has_many :vouchers_as_student, source: :vouchers, foreign_key: :student_id
  has_many :availabilities
  has_many :timeslots, through: :availabilities
  has_many :timeslots_as_student, class_name: "Timeslot", foreign_key: :student_id
  has_many :homeworks, through: :timeslots
  has_one_attached :photo

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :price_per_hour, presence: true, if: -> { teacher == true }
  validates :description, length: { minimum: 50 }, if: -> { teacher == true }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
