$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fassets_presentations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fassets_presentations"
  s.version     = FassetsPresentations::VERSION
  s.authors     = ["Christopher Sharp", "Julian Bäume"]
  s.email       = ["cdsharp@gmail.com", "julian@svg4all.de"]
  s.homepage    = "https://github.com/fassets/fassets_presentations"
  s.summary     = "A plugin for fassets that supports presentation assets."
  s.description = "Using this plugin, it’s possible to create and present presentations, while using the power of
                  fassets_core to organise, classify and filter presentations represented as digital assets."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "kramdown"
  s.add_dependency "acts_as_tree_rails3"
  s.add_dependency "jquery-rails"
  s.add_dependency "bibtex-ruby"
  s.add_dependency "citeproc-ruby"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "devise"
end
