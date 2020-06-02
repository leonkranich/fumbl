class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :create]

  def index
    @teachers = User.where(teacher: true)
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
