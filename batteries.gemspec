lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "batteries/version"

Gem::Specification.new do |spec|
  spec.name = "batteries"
  spec.version = Batteries::VERSION
  spec.authors = ["Adam Daniels"]
  spec.email = ["adam@mediadrive.ca"]

  spec.summary = %q(Powering your Roda/Sinatra applications)
  spec.homepage = "https://github.com/adam12/batteries"
  spec.license = "MIT"

  spec.files = ["README.md", "LICENSE.txt"] + Dir["lib/**/*.rb"]

  spec.add_development_dependency "rubygems-tasks", "~> 0.2"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
end
