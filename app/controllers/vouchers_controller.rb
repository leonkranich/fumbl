class VouchersController < ApplicationController
  require 'date'
  def new
    @teacher = User.find(params[:teacher_id])
    @voucher = Voucher.new
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @teacher = User.find(params[:teacher_id])
    @voucher.teacher = @teacher
    @voucher.student = current_user
    @next_day = set_availability
    if @voucher.save
      flash[:notice] = "Booking Confirmed"
     redirect_to new_availability_booking_path(@next_day)
   else
     redirect_to teacher_path(teacher)
   end
  end

  private

  def voucher_params
    params.require(:voucher).permit(:counter, :price_per_hour)
  end

  def set_availability
    @teacher.availabilities.find_by(day: @availability.day + 1.day, teacher_id: @teacher.id)
  end
end
