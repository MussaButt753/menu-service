# frozen_string_literal: true

module Resolvers
  class Section < BaseResolver
    description 'Get section by id'

    type Types::SectionType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      ::Section.find(id)
    end
  end
end
