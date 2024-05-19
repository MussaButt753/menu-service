# frozen_string_literal: true

module ModifierGroups
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      ModifierGroup.create!(@input)
    end
  end
end
