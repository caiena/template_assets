require 'rails_helper'

describe TemplateAssets::Configuration do

  context 'cache_store' do
    context 'in Rails.env.production' do
      it 'has a default MemoryStore cache_store of 1MB' do
        allow(Rails).to receive(:env) do
          ActiveSupport::StringInquirer.new('production')
        end

        config = TemplateAssets::Configuration.new
        expect(config.cache_store).to be_a(ActiveSupport::Cache::MemoryStore)
      end
    end

    context 'in Rails.env.development' do
      it 'has a default NullStore cache_store' do
        allow(Rails).to receive(:env) do
          ActiveSupport::StringInquirer.new('development')
        end

        config = TemplateAssets::Configuration.new
        expect(config.cache_store).to be_a(ActiveSupport::Cache::NullStore)
      end
    end

    context 'in Rails.env.test' do
      it 'has a default NullStore cache_store' do
        allow(Rails).to receive(:env) do
          ActiveSupport::StringInquirer.new('test')
        end

        config = TemplateAssets::Configuration.new
        expect(config.cache_store).to be_a(ActiveSupport::Cache::NullStore)
      end
    end

  end


end
