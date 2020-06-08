class DashboardsController < ApplicationController
  def index
    @user = current_user
    @timeslots = @user.timeslots_as_student
    if params[:selected_id]
      @selected_timeslot = @timeslots.find { |timeslot| timeslot.id == params[:selected_id].to_i }
    else
      @selected_timeslot = @timeslots.first
    end
  end
end
