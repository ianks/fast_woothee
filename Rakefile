# frozen_string_literal: true

begin
  require 'bundler/gem_tasks'
rescue LoadError => _e
  nil
end

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:rspec)

  desc 'Run Rust & Ruby testsuites'
  task spec: ['thermite:build', 'thermite:test'] do
    Rake::Task[:rspec].invoke
  end
rescue LoadError => _e
  nil
end

require 'thermite/tasks'
Thermite::Tasks.new

task default: %w(thermite:build)
