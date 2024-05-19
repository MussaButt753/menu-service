# frozen_string_literal: true

module Mutations
  class CreateMenuSection < BaseMutation
    argument :menu_id, Integer, required: true
    argument :section_id, Integer, required: true
    argument :display_order, Integer, required: false

    field :menu_section, Types::MenuSectionType, null: false

    def resolve(args)
      {
        menu_section: MenuSections::CreateService.new(input: args).call
      }
    end
  end
end
