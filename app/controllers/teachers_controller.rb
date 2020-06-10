class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :create]

  def index
    @teachers = User.where(teacher: true)#.shuffle
    @teachers_geocoded = User.geocoded
    @teachers = @teachers.search_by_address(params[:query])
    # @instruments = @instruments.search_by_name(params[:query]) # render_to_stringurns teachers with coordinates
    @markers = @teachers.map do |teacher|
      {
        lat: teacher.latitude,
        lng: teacher.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { teacher: teacher }),
        image_url: helpers.asset_url('guitar-solid.svg')
      }
    end
  end


  def show
    @marker = [
      {lat: @teacher.latitude,
       lng: @teacher.longitude,
       infoWindow: render_to_string(partial: "info_window_show", locals: { teacher: @teacher }),
       image_url: helpers.asset_url('noten.png')
    }]
    @instruments = Instrument.where(user_id: params[:id])
    @genres = Genre.where(user_id: params[:id])
    @reviews = Review.where(teacher_id: params[:id])
    @availabilities = Availability.where(teacher_id: params[:id])
    @timeslots = Timeslot.where(availability_id: params[:id])
    @vouchers = Voucher.where(teacher_id: params[:id])
    @voucher = Voucher.new
  end

  # def new
  #   @teacher = Teacher.new(params)
  # end

  # def create
  #   @teacher = Teacher.new(params)
  # end

  private

  def set_teacher
    @teacher = User.find(params[:id])
  end



  # def teacher_params
  #   params.require(teacher).permit(:name
  # end
end
