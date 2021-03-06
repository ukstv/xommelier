# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'xommelier/version'

Gem::Specification.new do |s|
  s.name        = 'xommelier'
  s.version     = Xommelier::VERSION
  s.authors     = ['Alexander Semyonov']
  s.email       = %w(al@semyonov.us)
  s.homepage    = 'http://github.com/alsemyonov/xommelier'
  s.summary     = %q{Xommelier is an XML Sommelier}
  s.description = %q{XML-Object Mapper with many built-in XML formats supported}
  s.license     = 'MIT'

  s.rubyforge_project = 'xommelier'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_dependency 'nokogiri', '~> 1.5'
  s.add_dependency 'activesupport'
  s.add_dependency 'activemodel'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake', '~> 10.1.0'
  s.add_development_dependency 'rspec', '~> 2.14.0'
  s.add_development_dependency 'simplecov', '~> 0.8.0'
end
