# encoding: utf-8
require "spec_helper"

module Refinery
  module Checkings
    module Admin
      describe Checking, type: :feature do
        refinery_login_with :refinery_user

       describe "checkings list" do
          before do
            FactoryGirl.create(:checking, :first_name => "UniqueTitleOne")
            FactoryGirl.create(:checking, :first_name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.checkings_admin_checkings_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

       describe "show" do
         let!(:checking) do
            FactoryGirl.create(:checking, :first_name => "UniqueTitleOne")
          end

         it "has expected text and menu" do
           visit refinery.checkings_admin_checkings_path

           click_link "Read the checking"

           expect(page).to have_content("UniqueTitleOne")
           expect(page).not_to have_content("UniqueTitleTwo")

           within "#actions" do
             expect(page).to have_content("Age")
             expect(page).to have_content("Back to all checkings")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/checkings']")
             expect(page).to have_content("Remove this checking forever")
             expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/checkings/#{checking.id}']")
           end
         end
       end

       describe "when no " do
         before { Refinery::Checkings::Checking.destroy_all }

         context "checkings" do
           it "shows expected message" do
            visit refinery.checkings_admin_checkings_path

            expect(page).to have_content("You have not received any checkings yet.")

            end
           end

     end

      describe "action links" do
        before { visit refinery.checkings_admin_checkings_path }

        specify "in the side pane" do
          within "#actions" do
            expect(page).to have_content("Inbox")
            expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/checkings']")

            expect(page).to have_content("Update who gets notified")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/checkings/settings/checking_notification_recipients/edit']")
            expect(page).to have_content("Edit confirmation email")
            expect(page).to have_selector("a[href*='/#{Refinery::Core.backend_route}/checkings/settings/checking_confirmation_message/edit']")
          end
        end
      end



        describe "destroy" do
          before { FactoryGirl.create(:checking, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.checkings_admin_checkings_path

            click_link "Remove this checking forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Checkings::Checking.count).to eq 0
          end
        end

          describe "destroy from checking show page" do
          before { FactoryGirl.create(:checking, :first_name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.checkings_admin_checking_path( :id => '1')

            click_link "Remove this checking forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Checkings::Checking.count).to eq 0
          end
          end

      end
    end
  end
end
