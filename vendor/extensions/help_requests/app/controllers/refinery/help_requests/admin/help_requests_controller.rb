module Refinery
  module HelpRequests
    module Admin
      class HelpRequestsController < ::Refinery::AdminController

        crudify :'refinery/help_requests/help_request', :xhr_paging => true

      end
    end
  end
end
