
require 'rails_helper'

RSpec.describe Sections::Finder, type: :service do
  let!(:menu1) { create(:menu) }
  let!(:menu2) { create(:menu) }
  let!(:section1) { create(:section, label: 'Section One', menu: menu1) }
  let!(:section2) { create(:section, label: 'Section Two', menu: menu2) }
  let!(:section3) { create(:section, label: 'Another Section', menu: menu1) }

  describe '#with_label' do
    context 'when label is provided' do
      it 'returns sections with the specified label' do
        finder = Sections::Finder.new.with_label('Section One')
        expect(finder).to contain_exactly(section1)
      end
    end

    context 'when label is blank' do
      it 'returns all sections' do
        finder = Sections::Finder.new.with_label('')
        expect(finder).to contain_exactly(section1, section2, section3)
      end

      it 'returns all sections when label is nil' do
        finder = Sections::Finder.new.with_label(nil)
        expect(finder).to contain_exactly(section1, section2, section3)
      end
    end
  end

  describe '#with_menu_id' do
    context 'when menu_id is provided' do
      it 'returns sections with the specified menu_id' do
        finder = Sections::Finder.new.with_menu_id(menu1.id)
        expect(finder).to contain_exactly(section1, section3)
      end
    end

    context 'when menu_id is blank' do
      it 'returns all sections' do
        finder = Sections::Finder.new.with_menu_id('')
        expect(finder).to contain_exactly(section1, section2, section3)
      end

      it 'returns all sections when menu_id is nil' do
        finder = Sections::Finder.new.with_menu_id(nil)
        expect(finder).to contain_exactly(section1, section2, section3)
      end
    end
  end
end
