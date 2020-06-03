class BookingsController < ApplicationController
  def new
    @availability = Availability.find(params[:availability_id])
    @teacher = User.find(@availability.teacher_id)
    @timeslots = @availability.timeslots
    @next_day = next_day
    @previous_day = previous_day
  end

  def create
    @availability = Availability.find(params[:availability_id])
    @teacher = User.find(@availability.teacher_id)
    @timeslots = @availability.timeslots
  end

  def next_day
    # find next day as date object
    Availability.where(@availability.day + 1.day, user: @teacher.id).first
  end

  def previous_day
    Availability.where(@availability.day - 1.day, @teacher.id == teacher_id).first
  end
end
