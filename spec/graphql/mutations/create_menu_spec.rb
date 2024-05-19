require 'rails_helper'

RSpec.describe Mutations::CreateMenu, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($identifier: String!, $label: String!, $startDate: ISO8601Date, $endDate: ISO8601Date, $state: String!) {
          createMenu(input: { identifier: $identifier, state: $state, label: $label, startDate: $startDate, endDate: $endDate }) {
            menu {
              identifier
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
          identifier: 'menu-123',
          state: "test-state",
          label: 'Test Menu',
          startDate: Date.current.iso8601,
          endDate: (Date.current + 1.day).iso8601
        }
      end

      it 'creates a new menu and returns the menu details' do
        data = json_response['data']['createMenu']['menu']

        expect(data).to include(variables.with_indifferent_access)
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
          identifier: 'menu-123',
          state: "test-state",
          label: nil,
          startDate: Date.current.iso8601,
          endDate: (Date.current + 1.day).iso8601
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
        expect(errors.first['message']).to eq("Variable $label of type String! was provided invalid value")
      end
    end
  end
end