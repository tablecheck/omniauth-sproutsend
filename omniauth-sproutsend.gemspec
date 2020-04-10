$:.push File.expand_path("../lib", __FILE__)
require "omniauth-sproutsend/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-sproutsend"
  s.version     = OmniAuth::Sproutsend::VERSION
  s.authors     = ["vsevolod"]
  s.email       = ["gsevka@gmail.com"]
  s.homepage    = "https://github.com/tablecheck/omniauth-sproutsend"
  s.description = %q{OmniAuth strategy for Sproutsend}
  s.summary     = s.description
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'json', '~> 1.3'
  s.add_dependency 'omniauth-oauth2', '~>1.3.1'
  s.add_development_dependency 'bundler', '~> 2.0'

end
