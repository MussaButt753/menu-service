# frozen_string_literal: true

class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section
end
