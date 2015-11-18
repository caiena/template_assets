#
# template_assets initializer
#
#   We are adding precompile instructions to Rails Asset-pipeline,
# regarding RESTful 7 actions templates.
#   If you need extra custom templates/actions, add them here!
#

# precompiling template/action assets
Rails.application.config.assets.precompile << /.*\/?(index|new|show|edit).*\z/

TemplateAssets.configure do |config|
  #   This is where TemplateAssets gets initialized and you can customize it
  # to your needs.
  #
  #
  #   Here you can override TemplateAssets caching.
  #   Example using memcached:
  #
  # config.cache_store = ActiveSupport::Cache::MemCacheStore.new(
  #   'localhost',
  #   'server-downstairs.localnetwork:8229'
  # )
  #
end
