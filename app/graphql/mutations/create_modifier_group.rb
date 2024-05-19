# frozen_string_literal: true

module Mutations
  class CreateModifierGroup < BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :selection_required_min, Integer, required: true
    argument :selection_required_max, Integer, required: true

    field :modifier_group, Types::ModifierGroupType, null: false

    def resolve(args)
      {
        modifier_group: ModifierGroups::CreateService.new(input: args).call
      }
    end
  end
end
