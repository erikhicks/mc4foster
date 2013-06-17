module Refinery
  module ItemRequests
    module Admin
      class ItemRequestsController < ::Refinery::AdminController

        crudify :'refinery/item_requests/item_request', :xhr_paging => true

      end
    end
  end
end
