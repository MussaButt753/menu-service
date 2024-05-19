# frozen_string_literal: true

module Sections
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      Section.create!(@input)
    end
  end
end
