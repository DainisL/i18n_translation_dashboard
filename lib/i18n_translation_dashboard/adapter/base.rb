module I18nTranslationDashboard
  module Adapter
    class Base
      attr_reader :adapter, :db
      def initialize
        @db = I18nTranslationDashboard.db_adapter
      end

      class << self
        def db
          new.find_adapter
        end
      end

      def find_adapter
        @adapter ||= self.class.parent.const_get(@db.to_s.capitalize).new
      end
    end
  end
end
