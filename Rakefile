# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rurema"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :generate do
  Rurema.generate("./lib/rurema", version: RUBY_VERSION) do |klass|
    puts klass.name
  end
end

task :generate_all do
  version = %w(2.6.0 2.7.0 3.0.0 3.1.0)
  version.each { |version|
    puts "== Ruby #{version} =="
    Rurema.generate("./lib/rurema/docs", version: version) do |klass|
      puts "  #{klass.name}"
    end
    puts
  }
end
