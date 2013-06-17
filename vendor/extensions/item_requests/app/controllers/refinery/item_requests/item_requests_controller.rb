module Refinery
  module ItemRequests
    class ItemRequestsController < ::ApplicationController

      before_filter :find_all_item_requests
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @item_request in the line below:
        present(@page)
      end

      def show
        @item_request = ItemRequest.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @item_request in the line below:
        present(@page)
      end

    protected

      def find_all_item_requests
        @item_requests = ItemRequest.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/item_requests").first
      end

    end
  end
end
