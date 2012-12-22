class HomeController < ApplicationController
  def index
    @affiliates = Refinery::Affiliates::Affiliate.last(12)
  end
end
