$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "template_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "template_assets"
  s.version     = TemplateAssets::VERSION
  s.authors     = ["Pedro de Assis"]
  s.email       = ["pedro@caiena.net"]
  s.homepage    = "https://github.com/caiena/template_assets"
  s.summary     = "Organizing assets per template on a Rails app"
  s.description = "Organizing assets per template on a Rails app"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
