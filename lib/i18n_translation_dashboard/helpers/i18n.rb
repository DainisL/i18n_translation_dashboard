module I18nTranslationDashboard
  module Helpers
    class I18n
      class << self
        def extract_i18n_keys(hash:, parent_keys: [], base_key: nil)
          hash.inject([]) do |keys, (key, value) |
            full_key = Array((base_key if base_key))
            full_key << parent_keys + [key]
            if value.is_a?(Hash)
              keys += extract_i18n_keys(hash: value, parent_keys: full_key)
            elsif value.present?
              keys << full_key.compact.join(".")
            end
            keys
          end
        end
      end
    end
  end
end