require 'rails_helper'

RSpec.feature 'Template assets including', type: :feature do

  context 'with assets debug mode on' do
    before(:all) do
      @_debug_mode = Rails.application.config.assets.debug
      Rails.application.config.assets.debug = true
    end

    after(:all) do
      Rails.application.config.assets.debug = @_debug_mode
    end

    context 'dashboards#index' do
      scenario 'templates assets (javascript and stylesheet) are included' do
        visit '/dashboards'

        javascript = all('script', visible: false).find do |script|
          script[:src].match /\/assets\/views\/dashboards\/index(-\w+)?\.js$/
        end

        expect(javascript).not_to be_nil

        stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
          link[:href].match /\/assets\/views\/dashboards\/index(-\w+)?\.css$/
        end

        expect(stylesheet).to be_nil
      end
    end



    context 'dashboards#show' do

      scenario 'success renders show template, including its assets' do
        visit '/dashboards/1'

        javascript = all('script', visible: false).find do |script|
          script[:src].match /\/assets\/views\/dashboards\/show(-\w+)?\.js$/
        end

        expect(javascript).not_to be_nil


        stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
          link[:href].match /\/assets\/views\/dashboards\/show(-\w+)?\.css$/
        end

        expect(stylesheet).not_to be_nil
      end


      scenario 'failure redirects to #index, including its assets' do
        visit '/dashboards/1?failure=true'

        expect(current_path).to eq '/dashboards'

        javascript = all('script', visible: false).find do |script|
          script[:src].match /\/assets\/views\/dashboards\/index(-\w+)?\.js$/
        end

        expect(javascript).not_to be_nil

        stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
          link[:href].match /\/assets\/views\/dashboards\/index(-\w+)?\.css$/
        end

        expect(stylesheet).to be_nil
      end

    end
  end


  context 'with assets debug mode off' do
    before(:all) do
      @_debug_mode = Rails.application.config.assets.debug
      Rails.application.config.assets.debug = false
    end

    after(:all) do
      Rails.application.config.assets.debug = @_debug_mode
    end

    context 'dashboards#index' do
      scenario 'templates assets (javascript and stylesheet) are included' do
        visit '/dashboards'

        javascript = all('script', visible: false).find do |script|
          script[:src].match /\/assets\/views\/dashboards\/index(-\w+)?\.js$/
        end

        expect(javascript).not_to be_nil

        stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
          link[:href].match /\/assets\/views\/dashboards\/index(-\w+)?\.css$/
        end

        expect(stylesheet).to be_nil
      end
    end



    context 'dashboards#show' do

      scenario 'success renders show template, including its assets' do
        visit '/dashboards/1'

        javascript = all('script', visible: false).find do |script|
          script[:src].match /\/assets\/views\/dashboards\/show(-\w+)?\.js$/
        end

        expect(javascript).not_to be_nil


        stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
          link[:href].match /\/assets\/views\/dashboards\/show(-\w+)?\.css$/
        end

        expect(stylesheet).not_to be_nil
      end


      scenario 'failure redirects to #index, including its assets' do
        visit '/dashboards/1?failure=true'

        expect(current_path).to eq '/dashboards'

        javascript = all('script', visible: false).find do |script|
          script[:src].match /\/assets\/views\/dashboards\/index(-\w+)?\.js$/
        end

        expect(javascript).not_to be_nil

        stylesheet = all('link[rel=stylesheet]', visible: false).find do |link|
          link[:href].match /\/assets\/views\/dashboards\/index(-\w+)?\.css$/
        end

        expect(stylesheet).to be_nil
      end

    end
  end

end
