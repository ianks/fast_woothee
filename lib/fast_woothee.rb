# frozen_string_literal: true

require 'fiddle'

gem_root = File.dirname(File.dirname(__FILE__))
extension_path = File.join(gem_root, 'lib/fast_woothee.so')
library = ::Fiddle.dlopen(extension_path)
initalize_func = library['initialize_fast_woothee']
::Fiddle::Function.new(initalize_func, [], ::Fiddle::TYPE_VOIDP).call
