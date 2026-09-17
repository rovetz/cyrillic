# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "cyrillic/version"

Gem::Specification.new do |spec|
  spec.name          = "cyrillic"
  spec.version       = Cyrillic::VERSION
  spec.authors       = ["rovetz"]
  spec.email         = ["zakbox@gmail.com"]

  spec.summary       = "Romanization (transliteration) of Cyrillic"
  spec.description   = "Converts Cyrillic text to the Roman (Latin) script"
  spec.homepage      = "https://github.com/rovetz/cyrillic"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.3.0"

  spec.metadata["source_code_uri"] = "https://github.com/rovetz/cyrillic"
  spec.metadata["changelog_uri"] = "https://github.com/rovetz/cyrillic/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/rovetz/cyrillic/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").select { |f| File.file?(f) }.reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github Gemfile])
    end
  end
  spec.bindir        = "exe"
  spec.executables   = ["cyrillic"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "irb"
  spec.add_development_dependency "minitest", ">= 5.25"
  spec.add_development_dependency "rake", ">= 13.2"
  spec.add_development_dependency "rdoc"
  spec.add_development_dependency "rubocop", ">= 1.64"
  spec.add_development_dependency "simplecov", ">= 0.22"
end
