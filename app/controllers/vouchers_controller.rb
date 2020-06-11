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
    @voucher.price_cents = @teacher.price_per_hour * 100 * voucher_params[:counter].to_i
    @next_day = set_next_day
    if @voucher.save!
      flash[:notice] = "Booking Confirmed"
      redirect_to  new_teacher_booking_path(@teacher)
    else
      redirect_to teacher_path(teacher)
    end
  end

  private

  def voucher_params
    params.require(:voucher).permit(:counter)
  end

  def set_next_day
    Availability.find_by(teacher_id: @teacher.id, day: Date.today + 1)
  end
end
