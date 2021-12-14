require "rubygems"


Gem.pre_install do |installer|
  pp "==== rubygems_plugin rurema ===="
  pp Dir.getwd

  versions = %w(2_6_0 2_7_0 3_0_0 3_1_0).map { |v| v.gsub("_", ".") }
  target = RUBY_VERSION
  result = versions.map { |v| Gem::Version.create(v) }.select { |v| v <= Gem::Version.create(target) }.sort.last
  installer.spec.files = Dir['README.md', 'lib/*', "lib/rurema/docs/#{result.to_s.gsub(".", "_")}/**", base: installer.spec.full_gem_path]
#   pp installer
#   pp installer.spec.full_gem_path
#   pp installer.spec.files
end
