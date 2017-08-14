# frozen_string_literal: true

class FakeSearchOutput
  attr_reader :items

  def initialize
    @items = []
  end

  def <<(item)
    @items << item
  end
end
