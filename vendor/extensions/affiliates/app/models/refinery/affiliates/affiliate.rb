module Refinery
  module Affiliates
    class Affiliate < Refinery::Core::BaseModel
      self.table_name = 'refinery_affiliates'

      attr_accessible :url, :title, :specialist, :photo_id, :position

      acts_as_indexed :fields => [:url, :title, :specialist]

      validates :url, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
