require 'spec_helper'
describe I18nTranslationDashboard::TranslationsHelper do
  let(:url) { i18n_translation_dashboard }
  describe 'editable_type' do
    it "text" do
      string = (0...30).map { ('a'..'z').to_a[rand(26)] }.join
      expect(helper.editable_type(string)).to eq("text")
    end

    it 'textarea' do
      string = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
      expect(helper.editable_type(string)).to eq("textarea")
    end
  end
  describe 'translation_row' do
    let(:selected_locale) { 'en' }
    let(:key) { 'ss.aa.ff' }
    ['name', 'selected-locale', 'pk', 'type', 'title', 'url'].map do |data_atrr|
      it "include #{data_atrr}" do
        expect(helper.translation_row(key, selected_locale, url.translations_path)).to be_include(data_atrr)
      end
    end

    it "include given attributes" do
      [selected_locale, key ].map do |attr|
        expect(helper.translation_row(key, selected_locale, url.translations_path)).to be_include(attr)
      end
    end
  end
end
