module Refinery
  module HelpRequests
    class HelpRequestsController < ::ApplicationController

      before_filter :find_all_help_requests
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @help_request in the line below:
        present(@page)
      end

      def show
        @help_request = HelpRequest.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @help_request in the line below:
        present(@page)
      end

    protected

      def find_all_help_requests
        @help_requests = HelpRequest.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/help_requests").first
      end

    end
  end
end
