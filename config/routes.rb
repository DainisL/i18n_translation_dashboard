I18nTranslationDashboard::Engine.routes.draw do
  resources :translations, only: [:index] do
    collection { put :update }
  end
end
