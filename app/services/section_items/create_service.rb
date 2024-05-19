# frozen_string_literal: true

module SectionItems
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      SectionItem.create!(@input)
    end
  end
end
