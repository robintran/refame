module Refinery
  module Affiliates
    class Affiliate < Refinery::Core::BaseModel
      self.table_name = 'refinery_affiliates'

      SPECIALISTA = ['lipstick', 'blush', 'eyeliner']

      attr_accessible :url, :title, :specialist1, :photo_id, :position, :specialist2, :specialist3

      acts_as_indexed :fields => [:url, :title, :specialist1, :specialist2, :specialist3]

      belongs_to :photo, :class_name => '::Refinery::Image'

      def specialist
        [specialist1, specialist2, specialist3].join(" + ")
      end
    end
  end
end

