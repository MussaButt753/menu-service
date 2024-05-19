
require 'rails_helper'

RSpec.describe Modifiers::Finder, type: :service do
  let!(:modifier1) { create(:modifier) }
  let!(:modifier2) { create(:modifier) }

  describe '#initialize' do
    it 'initializes with a default scope of all modifiers' do
      finder = Modifiers::Finder.new
      expect(finder).to match_array([modifier1, modifier2])
    end

    it 'initializes with a provided scope' do
      scope = Modifier.where(id: modifier1.id)
      finder = Modifiers::Finder.new(scope)
      expect(finder).to match_array([modifier1])
    end
  end

  describe 'private #update_scope' do
    it 'updates the internal scope' do
      finder = Modifiers::Finder.new
      finder.send(:update_scope, Modifier.where(id: modifier1.id))
      expect(finder).to match_array([modifier1])
    end
  end
end
