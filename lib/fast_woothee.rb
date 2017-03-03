# frozen_string_literal: true
require 'thermite/fiddle'

gem_root = File.dirname(File.dirname(__FILE__))

Thermite::Fiddle.load_module 'initialize_fast_woothee',
                             cargo_project_path: gem_root,
                             ruby_project_path: gem_root
