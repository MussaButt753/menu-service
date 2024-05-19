# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Modifier, type: :model do
  # Test associations
  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:modifier_group) }
  end
end
