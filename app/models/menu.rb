# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :sections, through: :menu_sections

  validates :identifier, :label, presence: true
  validates :identifier, uniqueness: true
end
