module TemplateAssets
  module AssetsHelper

    def asset_exists?(subdirectory, filename)
      TemplateAssets.cache.fetch("template_assets::assets::#{subdirectory}/#{filename}") do
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
      asset_template = in_template_assets(template_name)

      stylesheet_link_tag(asset_template) if stylesheet_exists?(asset_template)
    end

    def template_javascript_include_tag_if_exists
      asset_template = in_template_assets(template_name)

      javascript_include_tag(asset_template) if javascript_exists?(asset_template)
    end


    private

    def in_template_assets(asset_name)
      File.join(TemplateAssets.config.assets_dir, asset_name)
    end
  end
end
