class ReaderMailer < ActionMailer::Base
  default from: "test@test.com"

  def welcome(address)
    mail( to: address, subject: "Libapp registration" )
  end
end
