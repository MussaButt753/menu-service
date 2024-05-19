# frozen_string_literal: true

module MenuSections
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      MenuSection.create!(@input)
    end
  end
end
