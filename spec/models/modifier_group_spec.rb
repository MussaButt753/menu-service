# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ModifierGroup, type: :model do
  # Test associations
  describe 'associations' do
    it { should have_one(:item_modifier_group) }
    it { should have_one(:item).through(:item_modifier_group) }
    it { should have_many(:modifiers) }
  end

  # Test validations
  describe 'validations' do
    it { should validate_presence_of(:identifier) }

    it { should validate_numericality_of(:selection_required_min).only_integer.is_greater_than_or_equal_to(0) }
  end
end
