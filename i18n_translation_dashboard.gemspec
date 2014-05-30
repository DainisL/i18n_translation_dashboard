$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "i18n_translation_dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "i18n_translation_dashboard"
  s.version     = I18nTranslationDashboard::VERSION
  s.authors     = ["DainisL"]
  s.email       = ["dainsi186@gmail.com"]
  s.homepage    = "https://github.com/DainisL"
  s.summary     = "i18n translation dashboard"
  s.description = "i18n translation dashboard"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency "redis", '~> 3.0.7'
  s.add_dependency "rails-i18n", '~> 4.0.2'

  s.add_development_dependency "sqlite3"
end
