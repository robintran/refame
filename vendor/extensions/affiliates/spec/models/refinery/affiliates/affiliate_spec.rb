require 'spec_helper'

module Refinery
  module Affiliates
    describe Affiliate do
      describe "validations" do
        subject do
          FactoryGirl.create(:affiliate,
          :url => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:url) { should == "Refinery CMS" }
      end
    end
  end
end
