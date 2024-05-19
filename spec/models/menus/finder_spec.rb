require 'rails_helper'

RSpec.describe Menus::Finder, type: :service do
  let!(:menu1) { create(:menu, label: 'Menu One') }
  let!(:menu2) { create(:menu, label: 'Menu Two') }
  let!(:menu3) { create(:menu, label: 'Another Menu') }

  describe '#with_label' do
    context 'when label is provided' do
      it 'returns menus with the specified label' do
        finder = Menus::Finder.new.with_label('Menu One')
        expect(finder).to contain_exactly(menu1)
      end
    end

    context 'when label is blank' do
      it 'returns all menus' do
        finder = Menus::Finder.new.with_label('')
        expect(finder).to contain_exactly(menu1, menu2, menu3)
      end

      it 'returns all menus when label is nil' do
        finder = Menus::Finder.new.with_label(nil)
        expect(finder).to contain_exactly(menu1, menu2, menu3)
      end
    end
  end
end