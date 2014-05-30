Rails.application.routes.draw do
  mount I18nTranslationDashboard::Engine => "/i18n_translation_dashboard"
end
