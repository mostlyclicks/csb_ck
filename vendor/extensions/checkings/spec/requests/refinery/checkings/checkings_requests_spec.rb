require "spec_helper"

module Refinery
  module Checkings

    describe "Checkings request specs", type: :request do

      before(:each) do
        Refinery::Checkings::Engine.load_seed
      end

      it "successfully gets the index path as redirection" do
        get("/checkings")
        expect(response).to be_redirect
        expect(response).to redirect_to("/checkings/new")
      end

      it "successfully gets the new path" do
        get("/checkings/new")
        expect(response).to be_success
        expect(response).to render_template(:new)
      end

      it "successfully gets the thank_you path" do
        get("/checkings/thank_you")
        expect(response).to be_success
        expect(response).to render_template(:thank_you)
      end

    end
  end
end
