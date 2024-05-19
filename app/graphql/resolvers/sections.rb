# frozen_string_literal: true

module Resolvers
  class Sections < BaseResolver
    description 'Get section list'

    type [Types::SectionType], null: false

    argument :label, String, required: false
    argument :menu_id, Integer, required: false
    argument :page, Integer, required: false
    argument :limit, Integer, required: false

    def resolve(label: nil, menu_id: nil, page: nil, limit: nil)
      ::Sections::Finder
        .new
        .with_menu_id(menu_id)
        .with_label(label)
        .page(page)
        .per(limit)
    end
  end
end
