class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :create]

  def index
    @teachers = User.where(teacher: true)
  end

  def show
    @instruments = Instrument.where(user_id: params[:id])
    @genres = Genre.where(user_id: params[:id])
    @reviews = Review.where(teacher_id: params[:id])
    @availabilities = Availability.where(teacher_id: params[:id])
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
