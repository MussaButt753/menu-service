# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  # Test associations
  describe 'associations' do
    it { should have_many(:menu_sections).dependent(:destroy) }
    it { should have_many(:sections).through(:menu_sections) }
  end

  # Test validations
  describe 'validations' do
    it { should validate_presence_of(:identifier) }
    it { should validate_presence_of(:label) }
  end
end
