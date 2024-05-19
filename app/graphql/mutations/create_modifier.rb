# frozen_string_literal: true

module Mutations
  class CreateModifier < BaseMutation
    argument :default_quantity, Integer, required: false
    argument :display_order, Integer, required: false
    argument :price_override, Float, required: false
    argument :item_id, Integer, required: true
    argument :modifier_group_id, Integer, required: true

    field :modifier, Types::ModifierType, null: false

    def resolve(args)
      {
        modifier: Modifiers::CreateService.new(input: args).call
      }
    end
  end
end
