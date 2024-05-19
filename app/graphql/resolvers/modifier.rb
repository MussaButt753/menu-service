# frozen_string_literal: true

module Resolvers
  class Modifier < BaseResolver
    description 'Get modifier by id'

    type Types::ModifierType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      ::Modifier.find(id)
    end
  end
end
