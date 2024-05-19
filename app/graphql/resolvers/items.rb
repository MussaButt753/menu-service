# frozen_string_literal: true

module Resolvers
  class Items < BaseResolver
    description 'Get item list'

    type [Types::ItemType], null: false

    # TODO: change it to enum
    argument :type, String, required: false
    argument :label, String, required: false
    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(label: nil, type: nil, page: nil, limit: nil)
      ::Items::Finder
        .new
        .with_label(label)
        .with_type(type)
        .page(page)
        .per(limit)
    end
  end
end
