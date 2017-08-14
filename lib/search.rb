# frozen_string_literal: true

require_relative 'search/errors'
require_relative 'search/db'
require_relative 'search/query'
require_relative 'search/output'

# Main Searching
module Search
  def self.perform(searching)
    db = DB.new('./db')
    db.each_table do |table|
      Query.new(table).find(searching)
    end
  end
end
