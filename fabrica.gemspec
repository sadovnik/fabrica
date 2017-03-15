# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'fabrica/version'

Gem::Specification.new do |spec|
  spec.name          = 'fabrica'
  spec.version       = Fabrica::VERSION
  spec.authors       = ['Cyril Sadovnik']
  spec.email         = ['cyril.sadovnik@gmail.com']

  spec.summary       = 'Allows you to create simple factories ad-hoc.'
  spec.homepage      = 'http://github.com/sadovnik/fabrica'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
