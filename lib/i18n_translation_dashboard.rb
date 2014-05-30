require "redis"
require 'i18n_translation_dashboard/configuration'
require 'i18n_translation_dashboard/helpers/i18n'
require 'i18n_translation_dashboard/helpers/base'
require "i18n_translation_dashboard/engine"
require 'i18n_translation_dashboard/translations'
require 'i18n_translation_dashboard/adapter/base'
require 'i18n_translation_dashboard/adapter/redis'

module I18nTranslationDashboard
  extend Configuration

  def self.db
    I18nTranslationDashboard::Adapter::Base.db
  end
end
