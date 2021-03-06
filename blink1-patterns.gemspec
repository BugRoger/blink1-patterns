# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blink1-patterns/version'

Gem::Specification.new do |gem|
  gem.name          = "blink1-patterns"
  gem.version       = Blink::Patterns::VERSION
  gem.authors       = ["Michael Schmidt"]
  gem.email         = ["michael.j.schmidt@gmail.com"]
  gem.description   = %q{Common Blink Patterns}
  gem.summary       = %q{A collection of patterns for the Blink(1) indicator light}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = `git ls-files -- exe/*`.split("\n").map{ |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
  gem.bindir        = 'exe'

  gem.add_dependency('rb-blink1')
end
