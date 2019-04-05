if ARGV.include?('--download-binary')
  ENV['CARGO'] = '/dev/null'
  ARGV.delete('--download-binary')
end

load File.expand_path('./Rakefile', __dir__)

Rake::Task['thermite:build'].invoke

File.open("Makefile", "wb") do |f|
  dummy_makefile(".").each do |line|
    f.puts(line)
  end
end

$makefile_created = true
