require 'rails_helper'

RSpec.feature 'Template assets including', type: :feature do

  context 'dashboards#index' do
    scenario 'templates assets (javascript and stylesheet) are included' do
      visit '/dashboards'

      # IMPORTANT
      # we're using sprockets, and so, dashboards/index.js will be compiled to
      # dashboards.js
      javascript = all('script', visible: false).find do |script|
        # script[:src].match /\/assets\/views\/dashboards\/index.js.*/
        script[:src].match /\/assets\/views\/dashboards.js.*/
      end

      expect(javascript).not_to be_nil

      # IMPORTANT
      # we're using sprockets, and so, dashboards/index.css will be compiled to
      # dashboards.css
      stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
        link[:href].match /\/assets\/views\/dashboards.css.*/
      end

      expect(stylesheet).to be_nil
    end
  end



  context 'dashboards#show' do

    scenario 'success renders show template, including its assets' do
      visit '/dashboards/1'

      javascript = all('script', visible: false).find do |script|
        script[:src].match /\/assets\/views\/dashboards\/show.js.*/
      end

      expect(javascript).not_to be_nil


      stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
        link[:href].match /\/assets\/views\/dashboards\/show.css.*/
      end

      expect(stylesheet).not_to be_nil
    end


    scenario 'failure redirects to #index, including its assets' do
      visit '/dashboards/1?failure=true'

      expect(current_path).to eq '/dashboards'

      # IMPORTANT
      # we're using sprockets, and so, dashboards/index.js will be compiled to
      # dashboards.js
      javascript = all('script', visible: false).find do |script|
        # script[:src].match /\/assets\/views\/dashboards\/index.js.*/
        script[:src].match /\/assets\/views\/dashboards.js.*/
      end

      expect(javascript).not_to be_nil

      # IMPORTANT
      # we're using sprockets, and so, dashboards/index.css will be compiled to
      # dashboards.css
      stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
        link[:href].match /\/assets\/views\/dashboards.css.*/
      end

      expect(stylesheet).to be_nil
    end

  end

end
