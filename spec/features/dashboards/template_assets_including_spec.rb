require 'rails_helper'

RSpec.feature 'Template assets including', type: :feature do

  context 'dashboards#index' do
    scenario 'javascript template is included' do
      visit '/dashboards'

      javascript = all('script', visible: false).find do |script|
        script[:src].match /\/assets\/dashboards\/index.js.*/
      end

      expect(javascript).not_to be_nil
    end


    scenario 'stylesheet template is not included because it does not exist' do
      visit '/dashboards'

      stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
        link[:href].match /\/assets\/dashboards\/index.css.*/
      end

      expect(stylesheet).to be_nil
    end
  end



  context 'dashboards#show' do

    scenario 'success renders show template, including its assets' do
      visit '/dashboards/1'

      javascript = all('script', visible: false).find do |script|
        script[:src].match /\/assets\/dashboards\/show.js.*/
      end

      expect(javascript).not_to be_nil


      stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
        link[:href].match /\/assets\/dashboards\/show.css.*/
      end

      expect(stylesheet).not_to be_nil
    end


    scenario 'failure redirects to #index, including its assets' do
      visit '/dashboards/1?failure=true'

      expect(current_path).to eq '/dashboards'

      javascript = all('script', visible: false).find do |script|
        script[:src].match /\/assets\/dashboards\/index.js.*/
      end

      expect(javascript).not_to be_nil


      stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
        link[:href].match /\/assets\/dashboards\/index.css.*/
      end

      expect(stylesheet).to be_nil
    end

  end

end
