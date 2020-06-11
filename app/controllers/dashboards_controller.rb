class DashboardsController < ApplicationController
  def index
    @user = current_user
    if @user.timeslots_as_student.length.positive?
      @timeslots = @user.timeslots_as_student.where(booked: true)
      @selected_timeslot = params[:selected_id] ?
        @timeslots.find { |timeslot| timeslot.id == params[:selected_id].to_i } :
      @selected_timeslot = @timeslots.first
      @vouchers = @user.vouchers_as_student.where(teacher_id: @selected_timeslot.availability.teacher_id)
    end
  end
end
