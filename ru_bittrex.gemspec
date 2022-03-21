require_relative 'lib/ru_bittrex/version'

Gem::Specification.new do |spec|
  spec.name          = "ru_bittrex"
  spec.version       = RuBittrex::VERSION
  spec.authors       = ["david metta"]
  spec.email         = ["davideliemetta@gmail.com"]
  spec.summary       = "bittrex API wrapper"
  spec.description   = "this gem is a ruby wrapper for the bittrex API"
  spec.homepage      = "https://github.com/davidmetta/ru_bittrex"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/davidmetta/ru_bittrex.git"
  spec.metadata["changelog_uri"] = "https://github.com/davidmetta/ru_bittrex.git"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) { `git ls-files -z`.split("\x0") }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', "~> 1.8.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "mocha", "~> 1.11.2"
end
