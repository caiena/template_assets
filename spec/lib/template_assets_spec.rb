require 'rails_helper'

describe TemplateAssets do

  context '#configure' do

    it 'yields a TemplateAssets::Configuration parameter' do
      TemplateAssets.configure do |config|
        expect(config).to be_a(TemplateAssets::Configuration)
      end
    end

  end

  it 'creates an #template_name accessor on ActionView::Base' do
    expect(ActionView::Base.new).to respond_to(:template_name)
  end

end
