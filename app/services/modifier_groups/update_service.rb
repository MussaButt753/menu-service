# frozen_string_literal: true

module ModifierGroups
  class UpdateService
    def initialize(input:)
      @input = input
    end

    def call
      modifier_group.tap { modifier_group.update!(@input.except(:id)) }
    end

    private

    def modifier_group
      @modifier_group ||= ModifierGroup.find(@input[:id])
    end
  end
end
