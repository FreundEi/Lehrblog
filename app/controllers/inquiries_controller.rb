class InquiriesController < ApplicationController
  def inedx
    @inquiries = Inquiry.all
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.received_email(@inquiry).deliver
      redirect_to new_inquiry_path, notice: "送信しました"
    else
      redirect_to new_inquiry_path, notice: "入力内容に誤りがあります"
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
