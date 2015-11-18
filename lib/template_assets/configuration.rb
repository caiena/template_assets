require 'ostruct'

module TemplateAssets
  class Configuration
    attr_accessor :cache_store

    def initialize(options = {})
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
