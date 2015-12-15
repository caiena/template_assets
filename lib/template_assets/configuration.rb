require 'ostruct'

module TemplateAssets
  class Configuration
    DEFAULT_ASSETS_DIR = 'views'

    attr_accessor :assets_dir, :cache_store

    def initialize(options = {})
      @assets_dir = options.fetch(:assets_dir, DEFAULT_ASSETS_DIR)
      @cache_store = options.fetch(:cache_store, default_cache_store)
    end


    private

    def default_cache_store
      if Rails.env.production?
        ActiveSupport::Cache::MemoryStore.new(size: 1.megabyte)
      else
        ActiveSupport::Cache::NullStore.new
      end
    end
  end
end
