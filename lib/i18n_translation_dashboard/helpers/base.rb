module I18nTranslationDashboard
  module Helpers
    module Base
      module InstanceMethods
        def helpers(klass = find_self_class)
          I18nTranslationDashboard::Helpers.const_get(klass)
        end

        def find_self_class
          self.class.to_s.split("::").last
        end
      end
      
      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end