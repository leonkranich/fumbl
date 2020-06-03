class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :create]

  def index
    @teachers = User.where(teacher: true)
    @teachers_geocoded = User.geocoded # returns teachers with coordinates

    @markers = @teachers.map do |teacher|
      {
        lat: teacher.latitude,
        lng: teacher.longitude
      }
    end
  end

  def show
    set_teacher
  end

  # def new
  #   @teacher = Teacher.new(params)
  # end

  # def create
  #   @teacher = Teacher.new(params)
  # end

  private

  def set_teacher
    @teacher = User.find(params[:id])
  end

  # def teacher_params
  #   params.require(teacher).permit(:name
  # end
end
