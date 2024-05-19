# frozen_string_literal: true

module Resolvers
  class Item < BaseResolver
    description 'Get item by id'

    type Types::ItemType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      ::Item.find(id)
    end
  end
end
