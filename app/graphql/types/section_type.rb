# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String, null: false

    field :menu, MenuType, null: true
    field :section_items, [SectionItemType], null: false
    field :items, [ItemType], null: false
  end
end
