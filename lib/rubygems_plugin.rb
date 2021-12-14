require "rubygems"


Gem.pre_install do |installer|
  versions = %w(2_6_0 2_7_0 3_0_0 3_1_0).map { |v| v.gsub("_", ".") }
  target = RUBY_VERSION

  current_ver = versions.map { |v| Gem::Version.create(v) }.select { |v| v <= Gem::Version.create(target) }.sort.last.to_s
  exclude = versions - [current_ver]
  full_gem_path = installer.spec.full_gem_path
  files = Dir[*exclude.map { |ver| File.join(full_gem_path, "lib/rurema/docs", ver.gsub(".", "_"), "/**") }]
  files.map { |file| File.delete(file) }
end
