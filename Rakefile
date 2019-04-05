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
  task spec: ['thermite:build'] do
    Rake::Task[:rspec].invoke
  end
rescue LoadError => _e
  nil
end

task :default do
  require 'mkmf'

  if arg_config('--download-binary')
    ENV['CARGO'] = '/dev/null'
  end

  Rake::Task['thermite:build'].invoke
end
