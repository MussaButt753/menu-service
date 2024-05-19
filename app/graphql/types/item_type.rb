# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, ID, null: false
    field :type, String, null: false
    field :label, String, null: false
    field :description, String, null: true
    field :price, Float, null: true

    field :section, SectionType, null: true
    field :section_item, SectionItemType, null: true
    field :item_modifier_group, [ItemModifierGroupType], null: true
    field :modifier_groups, [ModifierGroupType], null: true
    field :modifier, ModifierType, null: true
  end
end
