# frozen_string_literal: true

class ModifierGroup < ApplicationRecord
  has_many :item_modifier_groups
  has_many :items, through: :item_modifier_groups
  has_many :modifiers

  validates :selection_required_min,
            numericality: { only_integer: true, greater_than: 0 }
  validates :selection_required_max,
            numericality: { only_integer: true, greater_than_or_equal_to: :selection_required_min }
end
