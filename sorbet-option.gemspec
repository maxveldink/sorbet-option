# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "sorbet-option"
  spec.version = "0.1.0"
  spec.authors = ["Max VelDink"]
  spec.email = ["maxveldink@gmail.com"]

  spec.summary = "Adds Typed::Option to sorbet-runtime, which is a basic, strongly-typed Option monad"
  spec.homepage = "https://github.com/maxveldink/sorbet-option"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/maxveldink/sorbet-option/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "sorbet-runtime", "~> 0.5"
end
