# coding: utf-8

# developemnt instructions:
# 1- Do your modifications
# 2- Increase version number in lib/rails_client_checker/version.rb
# 3- gem build rails_client_checker.gemspec
# 4a- test the code by pointing Gemfile entry to rails_client_checker path
# 4b- test by: gem install rails_client_checker-VERSION.gem then upgrade version in Gemfile
# 5- git add, commit and push
# 6- gem push rails_client_checker-VERSION.gem


lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_client_checker/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_client_checker"
  spec.version       = RailsClientChecker::VERSION
  spec.authors       = ["Hossam Hammady"]
  spec.email         = ["github@hammady.net"]
  spec.description   = %q{Offer end-users a configurable /check route to check their browsers compatibility with your Rails application,
	  with the ability to enable/disable standard checker modules or even add their own module logic in Javascript.
  	  Standard checkers are: browser name/version, cookies, asset loading and Pusher connectivity.}
  spec.summary       = %q{Offer end-users of Rails applications a configurable /check route to check their browsers compatibility.}
  spec.homepage      = "https://github.com/hammady/rails_client_checker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'rake', '~> 0'
end
