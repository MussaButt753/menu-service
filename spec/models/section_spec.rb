# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Section, type: :model do
  # Test associations
  describe 'associations' do
    it { should have_one(:menu_section).dependent(:destroy) }
    it { should have_one(:menu).through(:menu_section) }
    it { should have_many(:section_items).dependent(:destroy) }
    it { should have_many(:items).through(:section_items) }
  end

  # Test validations
  describe 'validations' do
    it { should validate_presence_of(:identifier) }
    it { should validate_presence_of(:label) }
  end
end
