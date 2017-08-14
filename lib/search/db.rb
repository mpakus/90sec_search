# frozen_string_literal: true

require 'oj'

module Search
  # Virtual DB over json
  class DB
    def initialize(dir)
      raise Search::ErrorDirNotFound, "Wrong DB directory path #{dir}" unless File.directory?(dir)
      @dir = dir
    end

    def each_table
      files.each do |file|
        yield parse(file) if block_given?
      end
    end

    private

    def parse(file)
      Oj.load(File.read(file))
    end

    def files
      @files ||= Dir.glob("#{@dir}/*.json")
    end
  end
end
