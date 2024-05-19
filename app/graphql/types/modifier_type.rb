# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Integer, null: false
    field :price_override, Float, null: true
    field :default_quantity, Integer, null: false
    field :item, ItemType, null: false
    field :modifier_group, ModifierGroupType, null: false
  end
end
