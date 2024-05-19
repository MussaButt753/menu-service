# frozen_string_literal: true

module Items
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      Item.create!(@input)
    end
  end
end
