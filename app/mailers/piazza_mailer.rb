class PiazzaMailer < ActionMailer::Base
  default from: "519adc1c395962241d82@cloudmailin.net"

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )
 
    # if email.has_attachments?
    #   email.attachments.each do |attachment|
    #     page.attachments.create({
    #       file: attachment,
    #       description: email.subject
    #     })
    #   end
    # end
  end
end


# 519adc1c395962241d82@cloudmailin.net