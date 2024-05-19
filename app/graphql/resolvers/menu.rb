# frozen_string_literal: true

module Resolvers
  class Menu < BaseResolver
    description 'Get menu by id'

    type Types::MenuType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      ::Menu.find(id)
    end
  end
end
