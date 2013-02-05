require 'spec_helper'

describe SessionsController do

  describe "GET new" do
    let!(:login) {mock_model("Login").as_new_record}
    it "sends new message" do
      Login.should_receive(:new)
      get :new
    end
    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
    it "assigns @login instance variable to the view" do
      Login.stub(:new).and_return(login)
      get :new
      expect(assigns[:login]).to eq(login)
    end
  end

end
