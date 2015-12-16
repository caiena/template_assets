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


  #   Assets dir used by template_assets. It defaults to 'views', so your
  # template javascripts shall be in 'app/assets/javascripts/views' and your
  # stylesheets in 'app/assets/stylesheets/views'. If you need to override it,
  # do it in the line below.
  #
  # config.assets_dir = 'views'

  #   These are the javascripts extensions that template_assets searches for.
  # If you need to increment it, use the line below.
  #
  # config.javascript_extensions = %w(.js .js.erb .js.coffee)

  #   These are the stylesheet extensions that template_assets searches for.
  # If you need to increment it, use the line below.
  #
  # config.stylesheet_extensions = %w(.css .css.erb .css.scss)

  #   Here you can override TemplateAssets caching.
  #   Example using memcached:
  #
  # config.cache_store = ActiveSupport::Cache::MemCacheStore.new(
  #   'localhost',
  #   'server-downstairs.localnetwork:8229'
  # )
  #
end
