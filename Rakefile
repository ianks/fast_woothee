# frozen_string_literal: true

begin
  require 'bundler/gem_tasks'
rescue LoadError => _e
  nil
end

require 'thermite/tasks'

project_dir = File.dirname(__FILE__)
Thermite::Tasks.new(cargo_project_path: project_dir,
                    ruby_project_path: project_dir)

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

task default: %w[thermite:build]
