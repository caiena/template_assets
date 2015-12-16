require 'ostruct'

module TemplateAssets
  class Configuration
    DEFAULT_OPTIONS = {
      assets_dir: 'views',
      cache_store: -> { default_cache_store },
      javascript_extensions: %w(.js .js.erb .js.coffee),
      stylesheet_extensions: %w(.css .css.erb .css.scss)
    }

    DEFAULT_OPTIONS.keys.each do |attribute|
      attr_accessor attribute
    end


    def initialize(options = {})
      DEFAULT_OPTIONS.keys.each do |attribute|
        self.send("#{attribute}=", find_option(attribute, options))
      end
    end


    private

    def self.default_cache_store
      if Rails.env.production?
        ActiveSupport::Cache::MemoryStore.new(size: 1.megabyte)
      else
        ActiveSupport::Cache::NullStore.new
      end
    end

    def find_option(name, options)
      default = DEFAULT_OPTIONS[name]
      default = default.call if default.respond_to?(:call)

      options.fetch(name, default)
    end

  end
end
