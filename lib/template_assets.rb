require 'template_assets/assets_helper'
require 'template_assets/action_view_ext'
require 'template_assets/configuration'

module TemplateAssets
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
  class << self
    alias :config :configuration
  end

  #   Alias facilitating the use of TemplateAssets.cache.fetch()..., while
  # keeping the familiarity with Rails.config.cache_store for configuration.
  def self.cache
    @configuration.cache_store
  end

  def self.configure
    yield configuration
  end
end
