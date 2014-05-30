require 'spec_helper'
describe I18nTranslationDashboard::Adapter::Redis, redis: true do
  subject { described_class.new } 
  describe "#db" do
    it "use redis instance" do
      expect(subject.db).to be_kind_of(Redis)
    end
  end

  describe '#normalize_keys' do
    let(:hash_with_multipe_keys) { { en: { first: { 'second' => { last: 'name' } } } } }  
    
    it "return array" do
      response = subject.normalize_keys(hash_with_multipe_keys) 
      expect(response).to be_kind_of(Array)
    end
  end

  describe '#update_key' do
    let(:key) { 'page.name' }
    let(:value) { 'home' }
    let(:locale) { :en }
    let(:key_with_locale) { locale.to_s + '.' + key }

    it "update key value" do
      expect{
        subject.update_key(key: key, value: value, locale: locale)
        }.to change{ subject.keys.count }.by(1)
    end

    it "key is comit" do
      subject.update_key(key: key, value: value, locale: locale)
      expect(subject.keys).to be_include(key_with_locale)
    end
  end

  describe '#method_missing' do
    it "return error" do
      expect{ subject.lost_method }.to raise_error NoMethodError
    end
  end
end