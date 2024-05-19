# frozen_string_literal: true

module Mutations
  class UpdateItem < BaseMutation
    argument :id, ID, required: true
    argument :price, Float, required: false
    argument :label, String, required: true
    argument :type, String, required: false
    argument :description, String, required: false

    field :item, Types::ItemType, null: false

    def resolve(args)
      {
        item: Items::UpdateService.new(input: args).call
      }
    end
  end
end
