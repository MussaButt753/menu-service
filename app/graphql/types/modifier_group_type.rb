# frozen_string_literal: true

module Types
  class ModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :selection_required_max, Integer, null: true
    field :selection_required_min, Integer, null: true

    field :modifiers, [ModifierType], null: false
    field :item_modifier_groups, [ItemModifierGroupType], null: false
    field :items, [ItemType], null: false
  end
end
