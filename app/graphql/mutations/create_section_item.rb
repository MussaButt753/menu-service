# frozen_string_literal: true

module Mutations
  class CreateSectionItem < BaseMutation
    argument :item_id, Integer, required: true
    argument :section_id, Integer, required: true
    argument :display_order, Integer, required: false

    field :section_item, Types::SectionItemType, null: false

    def resolve(args)
      {
        section_item: SectionItems::CreateService.new(input: args).call
      }
    end
  end
end
