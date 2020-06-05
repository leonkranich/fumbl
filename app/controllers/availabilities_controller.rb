class AvailabilitiesController < ApplicationController

  def update_associated_timeslots
    params[:timeslots].each do |key, value|
      if value == "1"
        timeslot = Timeslot.find(key)
        timeslot.booked = true
        timeslot.student = current_user
        timeslot.save!
      end
    end
    redirect_to dashboards_path
  end
end
