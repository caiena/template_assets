# extending ActionView when it has been successfully loaded
# - based on http://stackoverflow.com/a/28143878

# we are extending support to Rails ~> 3.2.0
# If we need to put different code based on Rails' version, do
#   if Rails::VERSION::MAJOR >= 4
#

module RenderTemplateExtension
  def render_template(*args)
    template = args.first

    # IMPORTANT in case our controller action uses `send_data` to send
    # custom data to the client, `template` will be an instance of
    # ActionView::Template::Text, wich has no #virtual_path.
    # TODO refactor this code, using:
    #  - Rails 3: template.mime_type
    #  - Rails 4 template.type
    @view.template_name = if template.respond_to?(:virtual_path)
      template.try(:virtual_path)
    else
      nil
    end

    super(*args)
  end


end

ActiveSupport.on_load(:action_view) do
  ActionView::Base.class_eval do
    attr_accessor :template_name
  end

  ActionView::TemplateRenderer.send(:prepend, RenderTemplateExtension)

  include TemplateAssets::AssetsHelper
end
