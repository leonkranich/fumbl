class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :create]

  def index
    @teachers = Teacher.all
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
    @teacher = Teacher.find(params[:id])
  end

  # def teacher_params
  #   params.require(teacher).permit(:name
  # end
end
