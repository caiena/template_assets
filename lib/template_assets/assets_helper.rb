module TemplateAssets
  module AssetsHelper

    def asset_exists?(subdirectory, filename)
      Rails.cache.fetch("assets_helper::#{subdirectory}/#{filename}") do
        !Dir[Rails.root.join('app', 'assets', subdirectory, "#{filename}*")].empty?
      end
    end

    def image_exists?(image)
      asset_exists?('images', image)
    end

    def javascript_exists?(script)
      asset_exists?('javascripts', "#{script}.js")
    end

    def stylesheet_exists?(stylesheet)
      asset_exists?('stylesheets', "#{stylesheet}.css")
    end


    def template_stylesheet_link_tag_if_exists
      stylesheet_link_tag(template_name) if stylesheet_exists?(template_name)
    end

    def template_javascript_include_tag_if_exists
      javascript_include_tag(template_name) if javascript_exists?(template_name)
    end
  end
end
