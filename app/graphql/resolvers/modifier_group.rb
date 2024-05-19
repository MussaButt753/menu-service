# frozen_string_literal: true

module Resolvers
  class ModifierGroup < BaseResolver
    description 'Get modifier group by id'

    type Types::ModifierGroupType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      ::ModifierGroup.find(id)
    end
  end
end
