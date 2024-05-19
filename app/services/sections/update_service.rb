# frozen_string_literal: true

module Sections
  class UpdateService
    def initialize(input:)
      @input = input
    end

    def call
      section.tap { section.update!(@input.except(:id)) }
    end

    private

    def section
      @section ||= Section.find(@input[:id])
    end
  end
end
