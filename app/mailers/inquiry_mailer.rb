class InquiryMailer < ApplicationMailer
  def received_email(inquiry)
    @inquiry = inquiry
    mail(
      form: "decoyphilia@gmail.com",
      to: "decoyphilia@gmail.com",
      subject: "お問い合わせ通知"
    )
  end
end
