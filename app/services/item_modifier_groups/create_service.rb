# frozen_string_literal: true

module ItemModifierGroups
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      ItemModifierGroup.create!(@input)
    end
  end
end
