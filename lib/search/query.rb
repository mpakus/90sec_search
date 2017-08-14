# frozen_string_literal: true

module Search
  # Seek and Output
  class Query
    def initialize(table, output = Search::Output.new)
      @table = table
      @output = output
    end

    def find(searching)
      @table.each do |item|
        @output << item if found?(item, searching.to_s)
      end
    end

    private

    # One level only, sorry no recursion today ;-)
    def found?(item, searching)
      item.each do |_k, v|
        if v.is_a? Array
          v.each { |value| return true if match?(value, searching) }
        elsif v.is_a? Hash
          v.each { |_key, value| return true if match?(value, searching) }
        elsif match?(v, searching)
          return true
        end
      end
      false
    end

    def match?(str, searching)
      str.to_s =~ /.*#{searching}.*/i
    end
  end
end
