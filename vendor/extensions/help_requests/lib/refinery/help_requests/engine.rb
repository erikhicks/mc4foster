module Refinery
  module HelpRequests
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::HelpRequests

      engine_name :refinery_help_requests

      initializer "register refinerycms_help_requests plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "help_requests"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.help_requests_admin_help_requests_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/help_requests/help_request'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::HelpRequests)
      end
    end
  end
end
