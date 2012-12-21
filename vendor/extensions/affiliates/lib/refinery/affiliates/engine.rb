module Refinery
  module Affiliates
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Affiliates

      engine_name :refinery_affiliates

      initializer "register refinerycms_affiliates plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "affiliates"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.affiliates_admin_affiliates_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/affiliates/affiliate',
            :title => 'url'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Affiliates)
      end
    end
  end
end
