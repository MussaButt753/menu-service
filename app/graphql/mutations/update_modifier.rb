# frozen_string_literal: true

module Mutations
  class UpdateModifier < BaseMutation
    argument :id, ID, required: true
    argument :price_override, Float, required: false
    argument :display_order, Integer, required: false
    argument :default_quantity, Integer, required: false

    field :modifier, Types::ModifierType, null: false

    def resolve(args)
      {
        modifier: Modifiers::UpdateService.new(input: args).call
      }
    end
  end
end
