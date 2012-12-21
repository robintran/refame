# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Affiliates" do
    describe "Admin" do
      describe "affiliates" do
        login_refinery_user

        describe "affiliates list" do
          before do
            FactoryGirl.create(:affiliate, :url => "UniqueTitleOne")
            FactoryGirl.create(:affiliate, :url => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.affiliates_admin_affiliates_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.affiliates_admin_affiliates_path

            click_link "Add New Affiliate"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Url", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Affiliates::Affiliate.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Url can't be blank")
              Refinery::Affiliates::Affiliate.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:affiliate, :url => "UniqueTitle") }

            it "should fail" do
              visit refinery.affiliates_admin_affiliates_path

              click_link "Add New Affiliate"

              fill_in "Url", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Affiliates::Affiliate.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:affiliate, :url => "A url") }

          it "should succeed" do
            visit refinery.affiliates_admin_affiliates_path

            within ".actions" do
              click_link "Edit this affiliate"
            end

            fill_in "Url", :with => "A different url"
            click_button "Save"

            page.should have_content("'A different url' was successfully updated.")
            page.should have_no_content("A url")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:affiliate, :url => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.affiliates_admin_affiliates_path

            click_link "Remove this affiliate forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Affiliates::Affiliate.count.should == 0
          end
        end

      end
    end
  end
end
