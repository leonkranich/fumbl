class BookingsController < ApplicationController
  before_action :set_availability, only: [:new, :create]
  before_action :set_teacher, only: [:new, :create]
  before_action :set_timeslots, only: [:new, :create]

  def new
    @next_day = next_day
    @previous_day = previous_day
    @vouchers_as_a_student = Voucher.find_by(student_id: current_user.id).counter
  end

  private

  def set_teacher
    @teacher = User.find(@availability.teacher_id)
  end

  def set_availability
    @availability = Availability.find(params[:availability_id])
  end

  def set_timeslots
    @timeslots = @availability.timeslots
  end

  def next_day
    # find next day as date object
    Availability.find_by(day: @availability.day + 1.day, teacher_id: @teacher.id)
  end

  def previous_day
    Availability.find_by(day: @availability.day - 1.day, teacher_id: @teacher.id)
  end
end
