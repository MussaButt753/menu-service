# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  # Test associations
  describe 'associations' do
    it { should have_many(:item_modifier_groups) }
    it { should have_many(:modifier_groups).through(:item_modifier_groups) }
    it { should have_one(:modifier).dependent(:destroy) }
    it { should have_one(:section_item) }
    it { should have_one(:section).through(:section_item) }
  end

  # Test validations
  describe 'validations' do
    it { should validate_presence_of(:identifier) }
    it { should validate_presence_of(:label) }
    it { should validate_presence_of(:price) }

    it { should validate_numericality_of(:price).is_greater_than(0.0) }
  end
end
