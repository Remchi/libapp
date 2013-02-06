require 'spec_helper'

describe ApplicationController do

  controller do
    def index
      raise AccessDenied
    end
  end

  describe "#access_denied" do
    it "redirects to access denied page" do
      get :index
      expect(response).to redirect_to access_denied_path
    end
  end

  describe "#current_user" do

    it "returns nil if reader is not logged in" do
      session[:reader_id] = nil
      expect(controller.current_user).to be_nil
    end

    it "returns reader object if reader is logged in" do
      reader = Reader.create( id: 1, email: "email@email.com", password: "pass", password_confirmation: "pass" )
      session[:reader_id] = reader.id
      expect(controller.current_user).to eq(reader)
    end

  end

end
