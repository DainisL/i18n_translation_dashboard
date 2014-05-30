require 'spec_helper'
describe I18nTranslationDashboard::Helpers::I18n do
  let(:hash_1) { { first: { 'second' => { last: 'name' } } } }  
  let(:string_1) { 'first.second.last' }

  describe ".extract_i18n_keys" do
    context "keys given" do
      it "convert hash path to string key" do
        expect(described_class.extract_i18n_keys(hash: hash_1).first).to eql string_1
      end

      it "retun array" do
        expect(described_class.extract_i18n_keys(hash: hash_1)).to be_kind_of(Array)
      end

      it "base_key is given" do
        expect(described_class.extract_i18n_keys(hash: hash_1[:first], base_key: 'first').first).to eql string_1     
      end      
    end

    context "empty hash" do
      it "retun array" do
        expect(described_class.extract_i18n_keys(hash: {})).to be_kind_of(Array)
      end

      it "base_key is given" do
        expect(described_class.extract_i18n_keys(hash: {}, base_key: nil)).to be_kind_of(Array) 
      end      
    end
  end
end