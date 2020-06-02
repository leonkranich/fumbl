class VouchersController < ApplicationController

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @voucher = Voucher.new
  end

  def create
    @voucher = Voucher.new(voucher_params)
    @teacher = Teacher.find(params[:teacher_id])
    @voucher.teacher = @teacher
    # Please finish
  end
end
