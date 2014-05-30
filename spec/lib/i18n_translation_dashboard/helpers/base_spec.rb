require 'spec_helper'
describe I18nTranslationDashboard::Helpers::Base do
  let(:include_object) { 
    Class.new do
      include I18nTranslationDashboard::Helpers::Base
    end.new
  }
  describe "helpers" do
    it "return class name" do
      expect(include_object.class.to_s).to be_eql include_object.find_self_class
    end
  end
end