module Refinery
  module Affiliates
    module Admin
      class AffiliatesController < ::Refinery::AdminController

        crudify :'refinery/affiliates/affiliate',
                :title_attribute => 'url', :xhr_paging => true

      end
    end
  end
end
