# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "HelpRequests" do
    describe "Admin" do
      describe "help_requests" do
        login_refinery_user

        describe "help_requests list" do
          before do
            FactoryGirl.create(:help_request, :title => "UniqueTitleOne")
            FactoryGirl.create(:help_request, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.help_requests_admin_help_requests_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.help_requests_admin_help_requests_path

            click_link "Add New Help Request"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::HelpRequests::HelpRequest.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::HelpRequests::HelpRequest.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:help_request, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.help_requests_admin_help_requests_path

              click_link "Add New Help Request"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::HelpRequests::HelpRequest.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:help_request, :title => "A title") }

          it "should succeed" do
            visit refinery.help_requests_admin_help_requests_path

            within ".actions" do
              click_link "Edit this help request"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:help_request, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.help_requests_admin_help_requests_path

            click_link "Remove this help request forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::HelpRequests::HelpRequest.count.should == 0
          end
        end

      end
    end
  end
end
