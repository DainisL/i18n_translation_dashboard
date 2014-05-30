require 'spec_helper'

describe I18nTranslationDashboard::Translations do
  describe '#keys_by_locale' do  
    it "get keys hash by locale" do
      keys = described_class.new.keys_by_locale(:en)
      expect(keys).to be_a_kind_of(Hash)
    end
  end

  describe "#keys_by_locale_and_group" do
    context "group nil" do
      it "return array" do
        keys = described_class.new.keys_by_locale_and_group(locale: :en, group: :page)
        expect(keys).to be_a_kind_of(Array)
      end
    end

    context "group is given" do
      it "return array" do
        keys = described_class.new.keys_by_locale_and_group(locale: :en, group: :page)
        expect(keys).to be_a_kind_of(Array)
        assert(keys.size > 0)
      end
    end
  end
  
  describe '.update' do
    it "response to class methode .update" do
      assert(described_class.respond_to?(:update))
    end

    context "when can update" do
      it "return hash with translation" do
        expect(described_class.update("page", "home", :en)).to eql page: "home"
      end
    end

    context "when can not update translation" do
      it "key is empty" do
        expect(described_class.update(" ", "home", :en)).to be_nil       
      end
    end
  end
end