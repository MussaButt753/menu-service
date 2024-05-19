require 'rails_helper'

RSpec.describe Mutations::CreateModifier, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($menuId: Int!, $sectionId: Int!, $displayOrder: Int) {
          createMenuSection(input: { menuId: $menuId, sectionId: $sectionId, displayOrder: $displayOrder }) {
            menuSection {
              menu { id }
              section { id }
              displayOrder
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:menu) { create(:menu) }
      let(:section) { create(:section) }

      let(:variables) do
        {
          menuId: menu.id,
          sectionId: section.id,
          displayOrder: 2
        }
      end

      it 'creates a new menu_section and returns the menu_section details' do
        data = json_response['data']['createMenuSection']['menuSection']

        expect(data["menu"]["id"]).to eq(menu.id.to_s)
        expect(data["section"]["id"]).to eq(section.id.to_s)
        expect(data["displayOrder"]).to eq(variables[:displayOrder])
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
          menuId: nil,
          sectionId: nil,
          displayOrder: 2
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
      end
    end
  end
end