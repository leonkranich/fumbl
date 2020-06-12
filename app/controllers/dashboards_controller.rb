class DashboardsController < ApplicationController
  def index
    @user = current_user
    if @user.timeslots_as_student.length.positive?
      @timeslots = @user.timeslots_as_student.where(booked: true)
      if params[:selected_id]
        @selected_timeslot = Timeslot.find(params[:selected_id])
      else
        @selected_timeslot = @timeslots.first
      end
      @vouchers = @user.vouchers_as_student.where(teacher_id: @selected_timeslot.availability.teacher_id)
      @teacher = @selected_timeslot.availability.teacher.first_name
      @teacher_avatar = @selected_timeslot.availability.teacher.photo_url
      @timeslot_time = @selected_timeslot.availability.day.strftime("%B %d  |  ") + @selected_timeslot.start_time.in_time_zone("Berlin").strftime("%H:%M")
    end
  end

  def download
    send_file(
      "#{Rails.root}/app/assets/images/love-me-tender.jpg",
      filename: "homework.jpg",
      type: "application/jpg"
    )

  end
end
