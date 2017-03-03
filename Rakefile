# frozen_string_literal: true
#
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'thermite/tasks'

RSpec::Core::RakeTask.new(:rspec)

Thermite::Tasks.new

desc 'Run Rust & Ruby testsuites'
task spec: ['thermite:build', 'thermite:test'] do
  Rake::Task[:rspec].invoke
end

task default: %w(thermite:build)
