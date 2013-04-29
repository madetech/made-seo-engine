$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seo"
  s.version     = Seo::VERSION
  s.authors     = ["Seb Ashton"]
  s.email       = ["seb@madebymade.co.uk"]
  s.homepage    = "http://www.madebymade.co.uk/"
  s.summary     = "SEO engine."
  s.description = "Rails engine that provides a polymorphic models to add meta data to pages, and a Sitemap"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
