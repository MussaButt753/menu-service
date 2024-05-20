# spec/mutations/update_modifier_spec.rb
require 'rails_helper'

RSpec.describe Mutations::UpdateModifier, type: :request do
  describe '.resolve' do
    let(:modifier) { create(:modifier) }

    let(:mutation) do
      <<~GQL
        mutation($id: ID!, $priceOverride: Float, $displayOrder: Int, $defaultQuantity: Int) {
          updateModifier(input: { id: $id, priceOverride: $priceOverride, displayOrder: $displayOrder, defaultQuantity: $defaultQuantity }) {
            modifier {
              id
              priceOverride
              displayOrder
              defaultQuantity
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:variables) do
        {
          id: modifier.id,
          priceOverride: 12.34,
          displayOrder: 1,
          defaultQuantity: 2
        }
      end

      it 'updates the modifier and returns the modifier details' do
        data = json_response['data']['updateModifier']['modifier']

        expect(data).to include(
          'id' => modifier.id.to_s,
          'priceOverride' => 12.34,
          'displayOrder' => 1,
          'defaultQuantity' => 2
        )
      end
    end

    context 'when the request has invalid inputs' do
      let(:variables) do
        {
          id: modifier.id,
          priceOverride: 'invalid_price',
          displayOrder: 1,
          defaultQuantity: 2
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
        expect(errors.first['message']).to include('Variable $priceOverride of type Float was provided invalid value')
      end
    end
  end
end
