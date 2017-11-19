lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "rdoc/task"
require "rubygems/tasks"
require "batteries"

RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.rdoc_files.include("README.md", "lib/**/*.rb")
end

Gem::Tasks.new

# Dogfooding!
Batteries::Tasks::Notes.new

desc "Run tests"
task :test do
  warn "No tests written"
end

task :default => :test
