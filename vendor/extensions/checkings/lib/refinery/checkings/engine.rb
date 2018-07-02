module Refinery
  module Checkings
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Checkings

      engine_name :refinery_checkings

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "checkings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.checkings_admin_checkings_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Checkings)
      end
    end
  end
end
