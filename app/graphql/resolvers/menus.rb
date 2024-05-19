# frozen_string_literal: true

module Resolvers
  class Menus < BaseResolver
    description 'Get menu list'

    type [Types::MenuType], null: false

    argument :label, String, required: false
    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(label: nil, page: nil, limit: nil)
      ::Menus::Finder
        .new
        .with_label(label)
        .page(page)
        .per(limit)
    end
  end
end
