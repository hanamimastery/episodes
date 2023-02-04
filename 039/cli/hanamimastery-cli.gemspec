# frozen_string_literal: true

require_relative "lib/hanamimastery/cli/version"

Gem::Specification.new do |spec|
  spec.name = "hanamimastery-cli"
  spec.version = Hanamimastery::CLI::VERSION
  spec.authors = ["Sebastian Wilgosz"]
  spec.email = ["sebastian@driggl.com"]

  spec.summary = "Command line p"
  spec.description = "A set of command line utility scripts helping with producing Hanami Mastery content."
  spec.homepage = "https://github.com/hanamimastery/cli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hanamimastery/cli"
  spec.metadata["changelog_uri"] = "https://github.com/hanamimastery/cli/tree/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-cli", "<= 1.0"
  spec.add_dependency "dry-configurable", "~> 1.0"
  spec.add_dependency "dry-system", "~> 1.0"
  spec.add_dependency "commonmarker", "~> 1.0.0.pre6"

  spec.add_runtime_dependency "zeitwerk", "~> 2.6"
end
