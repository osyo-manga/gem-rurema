# frozen_string_literal: true

require_relative "lib/rurema/version"

Gem::Specification.new do |spec|
  spec.name = "rurema"
  spec.version = Rurema::VERSION
  spec.authors = ["manga_osyo"]
  spec.email = ["manga.osyo@gmail.com"]

  spec.summary = "rurema"
  spec.description = "rurema"
  spec.homepage = "https://example.com"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files  = Dir['README.md']
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
