# frozen_string_literal: true

class ItemModifierGroup < ApplicationRecord
  belongs_to :item
  belongs_to :modifier_group
end
