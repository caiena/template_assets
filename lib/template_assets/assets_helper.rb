module TemplateAssets
  module AssetsHelper

    def asset_exists?(kind, filename, *extensions)

      filenames = if extensions.any?
        extensions.collect { |extension| "#{filename}#{extension}"}
      else
        [filename]
      end

      TemplateAssets.cache.fetch("template_assets::assets::#{kind}/#{filename}") do
        # Rails.application.assets is a Sprockets::Environment
        filenames.any? { |filename| Rails.application.assets[filename] }
      end
    end

    def image_exists?(image)
      asset_exists?('images', image)
    end

    def javascript_exists?(script)
      asset_exists?('javascripts', script, *TemplateAssets.config.javascript_extensions)
    end

    def stylesheet_exists?(stylesheet)
      asset_exists?('stylesheets', stylesheet, *TemplateAssets.config.stylesheet_extensions)
    end


    def template_stylesheet_link_tag_if_exists
      # guarding cases where ActionView::Template should not include template assets
      return nil if template_name.nil?

      template_asset = in_template_assets_dir(template_name)

      stylesheet_link_tag(template_asset, 'data-turbolinks-track': 'reload') if stylesheet_exists?(template_asset)
    end

    def template_javascript_include_tag_if_exists
      # guarding cases where ActionView::Template should not include template assets
      return nil if template_name.nil?

      template_asset = in_template_assets_dir(template_name)

      javascript_include_tag(template_asset, 'data-turbolinks-track': 'reload') if javascript_exists?(template_asset)
    end


    private

    def in_template_assets_dir(asset_name)
      File.join(TemplateAssets.config.assets_dir, asset_name)
    end
  end
end
