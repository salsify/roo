# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roo/version'

Gem::Specification.new do |spec|
  spec.name          = 'roo'
  spec.version       = Roo::VERSION
  spec.authors       = ['Thomas Preymesser', 'Hugh McGowan', 'Ben Woosley']
  spec.email         = ['ruby.ruby.ruby.roo@gmail.com']
  spec.summary       = 'Roo can access the contents of various spreadsheet files.'
  spec.description   = "Roo can access the contents of various spreadsheet files. It can handle\n* OpenOffice\n* Excel\n* Google spreadsheets\n* Excelx\n* LibreOffice\n* CSV"
  spec.homepage      = 'http://github.com/Empact/roo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6'

  spec.add_dependency 'csv'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'rubyzip', '>= 3.4.0'
  spec.add_dependency 'addressable'

  spec.add_development_dependency 'bundler', '>= 1.7'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'matrix'
  spec.add_development_dependency 'minitest', '>= 5.4.3'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'salsify_rubocop', '~> 1.0.1'
end
