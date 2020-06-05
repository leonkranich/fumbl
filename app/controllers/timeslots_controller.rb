class TimeslotsController < ApplicationController

  def edit
    @availability = Availability.find(params[:availability_id])
    @teacher = User.find(@availability.teacher_id)
    @timeslots = @availability.timeslots
  end

  def update
    @student = current_user
    @availability = Availability.find(params[:availability_id])
  end



end
