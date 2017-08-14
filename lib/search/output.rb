# frozen_string_literal: true

require 'awesome_print'

module Search
  # Human readable output
  class Output
    def <<(item)
      ap item
    end
  end
end
