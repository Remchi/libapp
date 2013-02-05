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

  describe "POST create" do
    let(:params) do
      {
        "email" => "email@email.com",
        "password" => "pass",
      }
    end
    let!(:login) { stub_model(Login) }

    before :each do
      Login.stub(:new).and_return(login)
    end

    context "when data is valid" do
      before :each do
        login.stub(:valid?).and_return(true)
      end

      it "sends authenticate message to Login model" do
        login.should_receive(:authenticate)
        post :create, login: params
      end

      context "when authenticate method returns true"
        before :each do
          login.stub(:authenticate).and_return(true)
          post :create, login: params
        end
        it "redirects to root url" do
          expect(response).to redirect_to root_url
        end
        it "assings a success flash message" do
          expect(flash[:notice]).not_to be_nil
        end
        it "authenticates reader" do
          expect(session[:reader_id]).not_to be_nil
        end
      end
    end

  describe "GET destroy" do
    it "set's session[:reader_id] to nil" do
      session[:reader_id] = 1
      get :destroy
      expect(session[:reader_id]).to be_nil
    end
    it "redirects to home page" do
      get :destroy
      expect(response).to redirect_to root_url
    end
  end

end
