class DashboardsController < ApplicationController
  def index
    @user = current_user
    @timeslots = @user.timeslots_as_student.where(booked: true)
    if params[:selected_id]
      @selected_timeslot = @timeslots.find { |timeslot| timeslot.id == params[:selected_id].to_i }
    else
      @selected_timeslot = @timeslots.first
    end
    @teacher = @selected_timeslot.availability.teacher
    @vouchers = @user.vouchers_as_student.where(teacher_id: @teacher.id)
  end
end
