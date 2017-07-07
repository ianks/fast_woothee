# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fast_woothee"
  spec.version       = "1.1.0"
  spec.authors       = ["Ian Ker-Seymer"]
  spec.email         = ["i.kerseymer@gmail.com"]

  spec.summary = 'Ruby bindings for woothee-rust'
  spec.description = 'Ruby bindings to woothee-rust'
  spec.homepage = "https://github.com/ianks/fast_woothee"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions = ['Rakefile']

  spec.add_runtime_dependency 'thermite', '~> 0'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "ffi", "~> 1.9"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-doc"
end
