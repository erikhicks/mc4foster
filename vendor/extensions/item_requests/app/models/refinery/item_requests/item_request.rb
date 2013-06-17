module Refinery
  module ItemRequests
    class ItemRequest < Refinery::Core::BaseModel
      self.table_name = 'refinery_item_requests'

      attr_accessible :title, :description, :contact, :expires, :position

      acts_as_indexed :fields => [:title, :description, :contact]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
