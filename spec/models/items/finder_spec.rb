# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Items::Finder, type: :service do
  let!(:item1) { create(:item, label: 'Item One', type: 'Product') }
  let!(:item2) { create(:item, label: 'Item Two', type: 'Component') }
  let!(:item3) { create(:item, label: 'Another Item', type: 'Product') }

  describe '#with_label' do
    context 'when label is provided' do
      it 'returns items with the specified label' do
        finder = Items::Finder.new.with_label('Item One')
        expect(finder.map(&:id)).to contain_exactly(item1.id)
      end
    end

    context 'when label is blank' do
      it 'returns all items' do
        finder = Items::Finder.new.with_label('')
        expect(finder.map(&:id)).to contain_exactly(item1.id, item2.id, item3.id)
      end

      it 'returns all items when label is nil' do
        finder = Items::Finder.new.with_label(nil)
        expect(finder.map(&:id)).to contain_exactly(item1.id, item2.id, item3.id)
      end
    end
  end

  describe '#with_type' do
    context 'when type is provided' do
      it 'returns items with the specified type' do
        finder = Items::Finder.new.with_type('Product')
        expect(finder.map(&:id)).to contain_exactly(item1.id, item3.id)
      end
    end

    context 'when type is blank' do
      it 'returns all items' do
        finder = Items::Finder.new.with_type('')
        expect(finder.map(&:id)).to contain_exactly(item1.id, item2.id, item3.id)
      end

      it 'returns all items when type is nil' do
        finder = Items::Finder.new.with_type(nil)
        expect(finder.map(&:id)).to contain_exactly(item1.id, item2.id, item3.id)
      end
    end
  end
end
