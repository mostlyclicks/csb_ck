require "spec_helper"

module Refinery
  module Checkings
    describe CheckingsController, type: :controller do

      before do
        @route = Refinery::Checkings::Engine.routes
        Refinery::Checkings::Engine::load_seed

        @new_page = Refinery::Page.new
        allow(Refinery::Page).to receive_messages(:where => [ @new_page ])
      end

      describe "GET new" do
        it "before_filter assigns a new checking" do
          get :new
          expect(assigns(:checking)).to be_a_new(Checking)
        end
        it "before_filter assigns page to checkings/new" do
          get :new
          expect(assigns(:page)).to eq @new_page
        end
      end

      describe "POST create" do

        before{
          allow_any_instance_of(Checking).to receive(:save).and_return( true )
        }


        it "before_filter assigns page to checkings/new" do
          post :create, checking: {first_name: "foo", last_name: "foo", email: "foo", phone: "foo", }
          expect(assigns(:page)).to eq @new_page
        end

        it "before_filter assigns a new checking" do
          post :create, checking: {first_name: "foo", last_name: "foo", email: "foo", phone: "foo", }
          expect(assigns(:checking)).to be_a_new(Checking)
        end

        it "redirects to thank_you" do
          post :create, checking: {first_name: "foo", last_name: "foo", email: "foo", phone: "foo", }
          expect(response).to redirect_to "/checkings/thank_you"
        end

        describe "when it can't save the checking" do

          before {
          allow_any_instance_of(Checking).to receive(:save).and_return( false )
          }

          it "redirects to new if it can't save" do
            post :create, checking: {first_name: "foo", last_name: "foo", email: "foo", phone: "foo", }

            expect(response).to render_template(:new)
          end
        end

      end
    end
  end
end
