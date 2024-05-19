require 'rails_helper'

RSpec.describe Mutations::CreateModifier, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($modifierGroupId: Int!, $itemId: Int!, $displayOrder: Int, $defaultQuantity: Int, $priceOverride: Float) {
          createModifier(input: { modifierGroupId: $modifierGroupId, itemId: $itemId, displayOrder: $displayOrder, defaultQuantity: $defaultQuantity, priceOverride: $priceOverride }) {
            modifier {
              item { id }
              modifierGroup { id }
              defaultQuantity
              displayOrder
              priceOverride
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:item) { create(:product) }
      let(:modifier_group) { create(:modifier_group) }

      let(:variables) do
        {
          itemId: item.id,
          modifierGroupId: modifier_group.id,
          displayOrder: 0,
          defaultQuantity: 12,
          priceOverride: 11.1
        }
      end

      it 'creates a new modifier_group and returns the modifier_group details' do
        data = json_response['data']['createModifier']['modifier']

        expect(data["item"]["id"]).to eq(item.id.to_s)
        expect(data["modifierGroup"]["id"]).to eq(modifier_group.id.to_s)
        expect(data["displayOrder"]).to eq(variables[:displayOrder])
        expect(data["defaultQuantity"]).to eq(variables[:defaultQuantity])
        expect(data["priceOverride"]).to eq(variables[:priceOverride])
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
          itemId: nil,
          modifierGroupId: nil,
          displayOrder: 0,
          defaultQuantity: 12,
          priceOverride: 11.1
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
      end
    end
  end
end