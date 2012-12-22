class HomeController < ApplicationController
  def index
    @affiliates = Refinery::Affiliates::Affiliate.order("position desc").last(12)
  end
end

