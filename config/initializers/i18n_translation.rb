key_value = I18n::Backend::KeyValue.new(I18nTranslationDashboard.db)
I18n.backend = I18n::Backend::Chain.new(key_value, I18n.backend)