class BookingJsonBuilder
  def initialize(teacher)
    @teacher = teacher
    @availabilities = Availability.where(teacher_id: @teacher.id)
  end

  def start
    end_hash = Hash.new
    end_hash["availabilities"] = {}
    @availabilities.each do  |availability|
      end_hash["availabilities"][availability.day.to_s] = {}
      timeslots = []
      availability.timeslots.where(booked:false).each do |timeslot|
        timeslots << build_string(timeslot)
      end
      end_hash["availabilities"][availability.day.to_s]["timeslots"] = timeslots
    end
    end_hash.to_json
  end

  private

  def build_string(timeslot)
    %Q[<div data-timeslot-id="#{timeslot.id}" class="timeslot-selection"><p>#{timeslot.start_time.strftime("%H:%M").to_s} - #{timeslot.end_time.strftime("%H:%M").to_s}</p></div>].html_safe
  end

end


