require "bundler/gem_tasks"

require 'rake/testtask'
require "rdoc/task"

desc "Run tests"
task :default => :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
end



RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'rescue_up_to'
  rdoc.main = "README.md"
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# require 'rubygems/package_task'
#
# spec = eval(File.read("rescue_up_to.gemspec"))
#
# Gem::PackageTask.new(spec) do |p|
#   p.gem_spec = spec
# end
