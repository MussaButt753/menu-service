require 'rails_helper'

RSpec.describe Mutations::CreateModifierGroup, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($identifier: String!, $label: String!, $selectionRequiredMin: Int!, $selectionRequiredMax: Int!) {
          createModifierGroup(input: { identifier: $identifier,label: $label, selectionRequiredMin: $selectionRequiredMin, selectionRequiredMax: $selectionRequiredMax }) {
            modifierGroup {
              identifier
              label
              selectionRequiredMin
              selectionRequiredMax
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:variables) do
        {
          identifier: 'modifier-group-123',
          label: "test-label",
          selectionRequiredMin: 1,
          selectionRequiredMax: 2
        }
      end

      it 'creates a new modifier_group and returns the modifier_group details' do
        data = json_response['data']['createModifierGroup']['modifierGroup']

        expect(data).to include(variables.with_indifferent_access)
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
          identifier: nil,
          label: "test-label",
          selectionRequiredMin: 1,
          selectionRequiredMax: 2
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
        expect(errors.first['message']).to eq("Variable $identifier of type String! was provided invalid value")
      end
    end
  end
end