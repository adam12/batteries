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

  spec.files = ["README.md", "Rakefile"] + Dir["lib/**/*.rb"]

  spec.add_development_dependency "rubygems-tasks", "~> 0.2"
end
