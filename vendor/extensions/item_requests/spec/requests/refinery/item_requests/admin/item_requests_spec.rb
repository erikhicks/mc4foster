# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ItemRequests" do
    describe "Admin" do
      describe "item_requests" do
        login_refinery_user

        describe "item_requests list" do
          before do
            FactoryGirl.create(:item_request, :title => "UniqueTitleOne")
            FactoryGirl.create(:item_request, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.item_requests_admin_item_requests_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.item_requests_admin_item_requests_path

            click_link "Add New Item Request"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ItemRequests::ItemRequest.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::ItemRequests::ItemRequest.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:item_request, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.item_requests_admin_item_requests_path

              click_link "Add New Item Request"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ItemRequests::ItemRequest.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:item_request, :title => "A title") }

          it "should succeed" do
            visit refinery.item_requests_admin_item_requests_path

            within ".actions" do
              click_link "Edit this item request"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:item_request, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.item_requests_admin_item_requests_path

            click_link "Remove this item request forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ItemRequests::ItemRequest.count.should == 0
          end
        end

      end
    end
  end
end
