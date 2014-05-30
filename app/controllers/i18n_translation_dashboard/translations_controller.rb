module I18nTranslationDashboard
  class TranslationsController < I18nTranslationDashboard::AdministrationController

    def index
      @selected_locale = params[:selected_locale] || 'en'
      @translations = TranslationsPresenter.new
    end

    def update
      respond_to do |format|
        if I18nTranslationDashboard::Translations.update(params[:name], 
                                                    params[:value],
                                                    params[:selected_locale])
          format.json  { render json: {status: 200} } 
        else
          format.json  { render json:  { status: 'error', msg: "Kļuda nevar saglabāt" } }
        end
      end
    end
  end
end
