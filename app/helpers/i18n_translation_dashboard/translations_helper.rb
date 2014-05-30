module I18nTranslationDashboard::TranslationsHelper
  def translation_row(key, selected_locale, url)
    attributes = { name: key, selected_locale: selected_locale, pk: 'id',
                   type: editable_type(t(key)), title: key, url: url }
    content_tag(:td, class: 'span3') do
      content_tag(:div, class: 'translation', data:  attributes) do
        t(key, locale: selected_locale)
      end + content_tag(:br, key)
    end
  end

  def editable_type(key)
    if key.length < 40
      'text'
    else
      'textarea'
    end
  end
end