require 'rails_helper'

RSpec.describe Mutations::CreateModifier, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($sectionId: Int!, $itemId: Int!, $displayOrder: Int) {
          createSectionItem(input: { sectionId: $sectionId, itemId: $itemId, displayOrder: $displayOrder }) {
            sectionItem {
              item { id }
              section { id }
              displayOrder
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:item) { create(:product) }
      let(:section) { create(:section) }

      let(:variables) do
        {
          itemId: item.id,
          sectionId: section.id,
          displayOrder: 2
        }
      end

      it 'creates a new section_item and returns the section_item details' do
        data = json_response['data']['createSectionItem']['sectionItem']

        expect(data["item"]["id"]).to eq(item.id.to_s)
        expect(data["section"]["id"]).to eq(section.id.to_s)
        expect(data["displayOrder"]).to eq(variables[:displayOrder])
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
          itemId: nil,
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