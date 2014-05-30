module I18nTranslationDashboard
  module Adapter
    class Redis
      include I18nTranslationDashboard::Helpers::Base
      
      attr_reader :db

      def initialize
        @db = ::Redis.new(db: ENV['I18N_TRANSLATION_DASHBOARD_REDIS_DB'] || 1 )
      end

      def normalize_keys(keys, base_key: nil)
        helpers('I18n').extract_i18n_keys(hash: keys, base_key: base_key)
      end

      def update_key(key:, value:, locale:)
        I18n.backend.store_translations(locale.to_s, {key => value}, :escape => false)
      end

      def method_missing(m, *args, &block)
        if @db.respond_to?(m.to_sym)
          @db.send(m, *args, &block)
        else
          super(m, *args, &block)
        end
      end
    end
  end
end
