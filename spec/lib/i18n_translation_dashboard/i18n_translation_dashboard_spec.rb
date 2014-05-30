require 'spec_helper'

describe I18nTranslationDashboard do
  describe 'setup' do
    context 'when default configuration' do
      it 'db is redis' do
        described_class.set_base_config
        expect(described_class.db_adapter).to eql :redis
      end
    end

    context 'when custom configuration' do
      before do
        described_class.configure do |config|
          config.db_adapter = :mongodb
        end
      end

      it 'return custom db' do
        expect(described_class.db_adapter).to eql :mongodb
      end
    end
  end

  describe '.db' do
    context 'redis adapter' do
      it 'return databas adapter object' do
        described_class.set_base_config
        expect(described_class.db).to be_kind_of(described_class::Adapter::Redis)
      end
    end
  end
end