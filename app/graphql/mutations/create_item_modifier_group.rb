# frozen_string_literal: true

module Mutations
  class CreateItemModifierGroup < BaseMutation
    argument :item_id, Integer, required: true
    argument :modifier_group_id, Integer, required: true

    field :item_modifier_group, Types::ItemModifierGroupType, null: false

    def resolve(args)
      {
        item_modifier_group: ItemModifierGroups::CreateService.new(input: args).call
      }
    end
  end
end
