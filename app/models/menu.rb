# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :sections, through: :menu_sections

  validates :label, presence: true
end
