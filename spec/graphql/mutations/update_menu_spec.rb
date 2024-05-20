require 'rails_helper'

RSpec.describe Mutations::UpdateMenu, type: :request do
  describe '.resolve' do
    let(:menu) { create(:menu) }

    let(:mutation) do
      <<~GQL
        mutation($id: ID!, $label: String!, $state: String!, $startDate: ISO8601Date, $endDate: ISO8601Date) {
          updateMenu(input: { id: $id, label: $label, state: $state, startDate: $startDate, endDate: $endDate }) {
            menu {
              id
              label
              state
              startDate
              endDate
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:variables) do
        {
          id: menu.id,
          label: 'Updated Label',
          state: 'active',
          startDate: '2024-01-01',
          endDate: '2024-12-31'
        }
      end

      it 'updates the menu and returns the menu details' do
        data = json_response['data']['updateMenu']['menu']

        expect(data).to include(
          'id' => menu.id.to_s,
          'label' => 'Updated Label',
          'state' => 'active',
          'startDate' => '2024-01-01',
          'endDate' => '2024-12-31'
        )
      end
    end

    context 'when the request has invalid inputs' do
      let(:variables) do
        {
          id: menu.id,
          label: '',
          state: 'active',
          startDate: '2024-01-01',
          endDate: '2024-12-31'
        }
      end

      it 'returns an error' do
        expect(json_response['exception']).not_to be_blank
      end
    end
  end
end
