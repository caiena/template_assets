require 'rails_helper'

describe 'action_view_ext' do
  it 'creates an #template_name accessor on ActionView::Base' do
    expect(ActionView::Base.new).to respond_to(:template_name)
  end
end
