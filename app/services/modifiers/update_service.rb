# frozen_string_literal: true

module Modifiers
  class UpdateService
    def initialize(input:)
      @input = input
    end

    def call
      modifier.tap { modifier.update!(@input.except(:id)) }
    end

    private

    def modifier
      @modifier ||= Modifiers.find(@input[:id])
    end
  end
end
