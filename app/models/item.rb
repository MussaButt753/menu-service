# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  has_one :modifier, dependent: :destroy

  has_one :section_item
  has_one :section, through: :section_item

  ALLOWED_TYPES = %w[Component Product].freeze

  validates :type, inclusion: {
    in: ALLOWED_TYPES,
    message: '%<value>s is not a valid type'
  }

  validates :identifier, :label, :price, presence: true
  validates :price, numericality: { greater_than: 0.0 }

  validates :identifier, uniqueness: true
end
