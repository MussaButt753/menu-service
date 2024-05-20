# frozen_string_literal: true

module Mutations
  class UpdateSection < BaseMutation
    argument :id, ID, required: true
    argument :label, String, required: true
    argument :description, String, required: false

    field :section, Types::SectionType, null: false

    def resolve(args)
      {
        section: Sections::UpdateService.new(input: args).call
      }
    end
  end
end
