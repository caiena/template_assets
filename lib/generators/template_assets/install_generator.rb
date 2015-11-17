require 'rails/generators/base'

module TemplateAssets
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc "Creates an initializer for template_assets at config/initializers/template_assets.rb"

      def copy_initializer
        template 'template_assets.rb', 'config/initializers/template_assets.rb'
      end

    end
  end
end
