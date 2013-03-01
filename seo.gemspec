$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seo"
  s.version     = Seo::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Seo."
  s.description = "TODO: Description of Seo."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end