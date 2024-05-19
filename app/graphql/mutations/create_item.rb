# frozen_string_literal: true

module Mutations
  class CreateItem < BaseMutation
    argument :identifier, String, required: true
    argument :price, Float, required: true
    argument :label, String, required: true
    argument :type, String, required: true
    argument :description, String, required: false

    field :item, Types::ItemType, null: false

    def resolve(args)
      {
        item: Items::CreateService.new(
          input: args.slice(*%i[price label type description identifier])
        ).call
      }
    end
  end
end
