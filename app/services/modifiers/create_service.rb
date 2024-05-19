# frozen_string_literal: true

module Modifiers
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      Modifier.create!(@input)
    end
  end
end
