# frozen_string_literal: true

module Types
  class SectionItemType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Integer, null: false

    field :section, SectionType, null: false
    field :item, ItemType, null: true
  end
end
