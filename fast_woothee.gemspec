# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fast_woothee'
  spec.version       = '1.6.3.beta.0'
  spec.authors       = ['Ian Ker-Seymer']
  spec.email         = ['i.kerseymer@gmail.com']

  spec.summary = 'Ruby bindings for woothee-rust'
  spec.description = 'Ruby bindings to woothee-rust'
  spec.homepage = 'https://github.com/ianks/fast_woothee'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.extensions = ['Rakefile']

  spec.add_dependency 'thermite'
  spec.add_dependency 'rexml'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'ffi', '~> 1.9'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
