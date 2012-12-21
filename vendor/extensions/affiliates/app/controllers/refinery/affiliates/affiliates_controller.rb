module Refinery
  module Affiliates
    class AffiliatesController < ::ApplicationController

      before_filter :find_all_affiliates
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @affiliate in the line below:
        present(@page)
      end

      def show
        @affiliate = Affiliate.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @affiliate in the line below:
        present(@page)
      end

    protected

      def find_all_affiliates
        @affiliates = Affiliate.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/affiliates").first
      end

    end
  end
end
