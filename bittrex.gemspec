require_relative 'lib/bittrex/version'

Gem::Specification.new do |spec|
  spec.name          = "bittrex"
  spec.version       = Bittrex::VERSION
  spec.authors       = ["david metta"]
  spec.email         = ["davideliemetta@gmail.com"]

  spec.summary       = "bittrex v3 wrapper"
  spec.description   = "this gem is a wrapper for bittrex v3"
  spec.homepage      = "https://github.com/davidmetta/bittrex-v3"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/davidmetta/bittrex-v3"
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
end