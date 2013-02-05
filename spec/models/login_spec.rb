require 'spec_helper'

describe Login do

  context "attributes" do

    let(:login) { Login.new }

    it "has email" do
      login.email = "email@email.com"
      expect(login.email).to eq("email@email.com")
    end

    it "has password" do
      login.password = "pass"
      expect(login.password).to eq("pass")
    end

  end

end
