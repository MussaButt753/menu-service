# frozen_string_literal: true

module Types
  class ItemModifierGroupType < Types::BaseObject
    field :modifier_group, ModifierGroupType, null: false
    field :item, ItemType, null: false
  end
end
