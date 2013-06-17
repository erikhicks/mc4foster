module Refinery
  module HelpRequests
    class HelpRequest < Refinery::Core::BaseModel
      self.table_name = 'refinery_help_requests'

      attr_accessible :title, :description, :contact, :expires, :position

      acts_as_indexed :fields => [:title, :description, :contact]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
