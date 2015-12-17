# extending ActionView when it has been successfully loaded
# - based on http://stackoverflow.com/a/28143878

# we are extending support to Rails ~> 3.2.0
# If we need to put different code based on Rails' version, do
#   if Rails::VERSION::MAJOR >= 4
#

ActiveSupport.on_load(:action_view) do
  ActionView::Base.class_eval do
    attr_accessor :template_name
  end

  ActionView::TemplateRenderer.class_eval do
    def render_template_with_template_name_accessor(*args)
      template = args.first
      @view.template_name = template.try(:virtual_path)
      render_template_without_template_name_accessor(*args)
    end

    alias_method_chain :render_template, :template_name_accessor
  end

  include TemplateAssets::AssetsHelper
end
