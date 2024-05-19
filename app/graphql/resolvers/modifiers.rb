# frozen_string_literal: true

module Resolvers
  class Modifiers < BaseResolver
    description 'Get list of modifiers'

    type [Types::ModifierType], null: false

    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(page: nil, limit: nil)
      ::Modifiers::Finder
        .new
        .page(page)
        .per(limit)
    end
  end
end
