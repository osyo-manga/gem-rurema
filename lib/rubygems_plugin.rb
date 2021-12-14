require "rubygems"

Gem.pre_install do |installer|
  versions = Dir.children("lib/rurema/docs").map { |v| v.gsub("_", ".") }
  target = RUBY_VERSION
  result = versions.map { |v| Gem::Version.create(v) }.select { |v| v <= Gem::Version.create(target) }.sort.last
  installer.spec.files = Dir['README.md', 'lib/*', "lib/rurema/docs/#{result.to_s.gsub(".", "_")}/**"]
end
