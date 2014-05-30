module I18nTranslationDashboard
  class Translations
    attr_reader :keys, :default_locale

    def initialize(locale: :en)
      @default_locale = locale.present? ? locale : I18n.default_locale
      load_translations
      get_keys
    end

    def keys_by_locale(locale = default_locale)
      keys[locale]
    end

    def keys_by_locale_and_group(locale:, group:)
      I18nTranslationDashboard.db.normalize_keys(keys[locale][group], base_key: group)
    end

    class << self
      def update(key, value, locale)
        if key.present?
          I18nTranslationDashboard.db.update_key(key: key, 
                                                 value: value, 
                                                 locale: locale ) 
        end
      end
    end

    private

    def load_translations
      I18n.backend.backends[1].load_translations      
    end

    def get_keys
      @keys ||=  I18n.backend.backends[1].send(:translations) 
    end
  end
end