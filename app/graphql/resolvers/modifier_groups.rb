# frozen_string_literal: true

module Resolvers
  class ModifierGroups < BaseResolver
    description 'Get list of modifier groups'

    type [Types::ModifierType], null: false

    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(page: nil, limit: nil)
      ::ModifierGroups::Finder
        .new
        .page(page)
        .per(limit)
    end
  end
end
