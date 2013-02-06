require 'spec_helper'

describe ReaderMailer do
  include EmailSpec::Matchers
  include EmailSpec::Helpers

  describe "#welcome" do
    let(:email) {ReaderMailer.welcome("email@email.com")}
    it "sets to be delivered to provided email" do
      expect(email).to deliver_to("email@email.com")
    end

    it "has welcome message in the body" do
      expect(email).to have_body_text("Welcome to the Libapp")
    end

    it "has subject" do
      expect(email).to have_subject("Libapp registration")
    end
  end
end
