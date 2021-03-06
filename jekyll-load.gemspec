# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/load/version'

Gem::Specification.new do |spec|

  spec.name          = 'jekyll-load'
  spec.version       = Jekyll::Load::VERSION
  spec.authors       = ['Greg Scott']
  spec.email         = ['i@gregoryjscott.com']
  spec.summary       = %q{Loads data into Jekyll pages.}
  spec.homepage      = 'https://github.com/gregoryjscott/jekyll-load'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'jekyll', '~> 2.5'

end
