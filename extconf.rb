if ARGV.include?('--download-binary')
  ENV['CARGO'] = '/dev/null'
  ARGV.delete('--download-binary')
end

load File.expand_path('./Rakefile', __dir__)

Rake::Task['thermite:build'].invoke

$makefile_created = true
dummy_makefile 'fast_woothee'
