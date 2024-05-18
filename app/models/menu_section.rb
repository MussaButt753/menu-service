# frozen_string_literal: true

class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  validates :default_order, numericality: { greater_than: 0 }
end
