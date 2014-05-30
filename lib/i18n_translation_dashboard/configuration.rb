module I18nTranslationDashboard
  module Configuration
    ATTRIBUTES = [:db_adapter].freeze

    attr_accessor(*ATTRIBUTES)

    def self.extended(base)
      base.set_base_config
    end

    def configure
      yield self
    end

    def set_base_config
      self.db_adapter = :redis
    end
  end
end
