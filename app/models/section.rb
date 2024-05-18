# frozen_string_literal: true

class Section < ApplicationRecord
  has_one :menu_section, dependent: :destroy
  has_one :menu
  has_many :section_items, dependent: :destroy
  has_many :items, through: :section_items

  validates :label, presence: true
end
