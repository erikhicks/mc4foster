module Refinery
  module ItemRequests
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ItemRequests

      engine_name :refinery_item_requests

      initializer "register refinerycms_item_requests plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "item_requests"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.item_requests_admin_item_requests_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/item_requests/item_request'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ItemRequests)
      end
    end
  end
end
