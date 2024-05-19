
require 'rails_helper'

RSpec.describe ModifierGroups::Finder, type: :service do
  let!(:modifier_group1) { create(:modifier_group, label: 'Group One') }
  let!(:modifier_group2) { create(:modifier_group, label: 'Group Two') }
  let!(:modifier_group3) { create(:modifier_group, label: 'Another Group') }

  describe '#with_label' do
    context 'when label is provided' do
      it 'returns modifier groups with the specified label' do
        finder = ModifierGroups::Finder.new.with_label('Group One')
        expect(finder).to contain_exactly(modifier_group1)
      end
    end

    context 'when label is blank' do
      it 'returns all modifier groups' do
        finder = ModifierGroups::Finder.new.with_label('')
        expect(finder).to contain_exactly(modifier_group1, modifier_group2, modifier_group3)
      end

      it 'returns all modifier groups when label is nil' do
        finder = ModifierGroups::Finder.new.with_label(nil)
        expect(finder).to contain_exactly(modifier_group1, modifier_group2, modifier_group3)
      end
    end
  end
end
