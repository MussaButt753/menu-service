# frozen_string_literal: true

class ModifierGroup < ApplicationRecord
  has_one :item_modifier_group
  has_one :item, through: :item_modifier_group

  has_many :modifiers

  validates :selection_required_min,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :selection_required_max,
            numericality: { only_integer: true, greater_than_or_equal_to: :selection_required_min }

  validates :identifier, uniqueness: true, presence: true
end
