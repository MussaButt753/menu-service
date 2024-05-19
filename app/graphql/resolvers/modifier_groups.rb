# frozen_string_literal: true

module Resolvers
  class ModifierGroups < BaseResolver
    description 'Get list of modifier groups'

    type [Types::ModifierType], null: false

    argument :label, String, required: false
    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(label: nil, page: nil, limit: nil)
      ::ModifierGroups::Finder
        .new
        .page(page)
        .per(limit)
    end
  end
end
