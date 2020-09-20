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
      redirect_to new_inquiry_path
    else
      redirect_to new_contact_path
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :message)
  end
end
