require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

# Don't push to rubygems, when doing `rake release`
task(:release).prerequisites.delete('release:rubygem_push')
