require 'rails_helper'

describe TemplateAssets::Configuration do

  context '#cache_store' do
    context 'in Rails.env.production' do
      it 'defaults to MemoryStore of 1MB' do
        allow(Rails).to receive(:env) do
          ActiveSupport::StringInquirer.new('production')
        end

        config = TemplateAssets::Configuration.new
        expect(config.cache_store).to be_a(ActiveSupport::Cache::MemoryStore)
      end
    end

    context 'in Rails.env.development' do
      it 'defaults to NullStore' do
        allow(Rails).to receive(:env) do
          ActiveSupport::StringInquirer.new('development')
        end

        config = TemplateAssets::Configuration.new
        expect(config.cache_store).to be_a(ActiveSupport::Cache::NullStore)
      end
    end

    context 'in Rails.env.test' do
      it 'default to NullStore' do
        allow(Rails).to receive(:env) do
          ActiveSupport::StringInquirer.new('test')
        end

        config = TemplateAssets::Configuration.new
        expect(config.cache_store).to be_a(ActiveSupport::Cache::NullStore)
      end
    end

  end



  context '#assets_dir' do
    it 'defaults to "views"' do
      config = TemplateAssets::Configuration.new
      expect(config.assets_dir).to eq 'views'
    end

    it 'can be overriden' do
      config = TemplateAssets::Configuration.new(assets_dir: 'overriden')
      expect(config.assets_dir).to eq 'overriden'
    end
  end

end
