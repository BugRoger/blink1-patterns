# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blink1-patterns/version'

Gem::Specification.new do |gem|
  gem.name          = "blink1-patterns"
  gem.version       = Blink::Patterns::VERSION
  gem.authors       = ["Michael Schmidt"]
  gem.email         = ["michael.j.schmidt@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^exe/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.bindir        = 'exe'

  gem.add_dependency('rb-blink1')
end
