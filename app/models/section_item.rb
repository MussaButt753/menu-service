# frozen_string_literal: true

class SectionItem < ApplicationRecord
  belongs_to :section
  belongs_to :item
end
