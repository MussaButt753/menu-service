# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe "#valid?" do
    it 'returns false with null label' do
      expect(build(:menu, label: nil).valid?).to be false
    end
  end
end
