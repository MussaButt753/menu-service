# frozen_string_literal: true

module Mutations
  class CreateSection < BaseMutation
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false

    field :section, Types::SectionType, null: false

    def resolve(args)
      {
        section: Sections::CreateService.new(input: args).call
      }
    end
  end
end
