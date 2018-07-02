# encoding: utf-8
require "spec_helper"

module Refinery
  module Checkings
    describe "checkings", type: :feature do

      before(:each) do
        Refinery::Checkings::Engine::load_seed
      end

      describe "Create checking" do

        before do
          visit refinery.new_checkings_checking_path
        end

        it "should create a new item" do
          fill_in "checking_first_name", :with => "Test"
          fill_in "checking_last_name", :with => "Test"
          fill_in "checking_email", :with => "Test"
          fill_in "checking_phone", :with => "Test"
          fill_in "checking_additional_comments", :with => "Test"

          click_button ::I18n.t('.refinery.checkings.checkings.new.send')

          expect(page).to have_content("Thank You")
          expect(Refinery::Checkings::Checking.count).to eq(1)
        end
      end
    end
  end
end

