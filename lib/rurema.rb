# frozen_string_literal: true

require_relative "rurema/version"
require "pathname"
require 'bitclust/searcher'

module Rurema
  using Module.new {
    refine String do
      def commentout
        self.split("\n").map { |it| "# #{it}" }.join("\n")
      end

      def indent(n = 1)
        lines.map { |it| "#{"  " * n}#{it}" }.join
      end
    end

    refine BitClust::MethodEntry do
      def method_doc
        <<~EOS
        #{source.commentout}
        def #{name}; end
        EOS
      end
    end

    refine BitClust::ClassEntry do
      def class_doc
        doc = <<~EOS
        #{entry_keyword} #{name}
        #{methods.sort.map(&:method_doc).map { |it| it.indent }.join("\n")}
        end
        EOS
      end

      def filename
        "#{realname.gsub(/::/, "__")}.rb"
      end

      def save(dir = "./")
        Dir.mkdir(dir) unless Dir.exist? dir
        File.open(File.join(dir, filename), "w") { |file|
          file.puts class_doc
        }
      end

      def entry_keyword
        case
        when class?
          "class"
        when module?
          "module"
        else
          "class"
        end
      end

      def find_entry(name)
        entries.find { |e| e.names.include? name.to_s }
      end

      def entries_all
        entries.map(&:name).flatten.map { |name| find_entry(name) }
      end
    end
  }

  class <<self
    def generate(savepaht = "./lib/rurema", version: RUBY_VERSION)
      tmp_bitclust_datadir = ENV["BITCLUST_DATADIR"]
      ENV["BITCLUST_DATADIR"] = dbpath(version: version)

      save_dir = File.join(savepaht, "#{version.gsub(".", "_")}")
      refe = BitClust::Searcher.new

      db = refe.send(:new_database)
      db.classes.each { |klass|
        yield klass
        klass.save save_dir
      }
    ensure
      ENV["BITCLUST_DATADIR"] = tmp_bitclust_datadir
    end

    private def dbpath(version: nil)
      config_path = Pathname(ENV['HOME']) + ".bitclust" + "config"
      if config_path.exist?
        config = YAML.load_file(config_path)
        "#{config[:database_prefix]}-#{version || config[:default_version]}"
      end
    end
  end
end
