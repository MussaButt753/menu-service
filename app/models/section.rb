# frozen_string_literal: true

class Section < ApplicationRecord
  has_one :menu_section, dependent: :destroy
  has_one :menu, through: :menu_section

  has_many :section_items, dependent: :destroy
  has_many :items, through: :section_items

  validates :identifier, :label, presence: true
  validates :identifier, uniqueness: true
end
