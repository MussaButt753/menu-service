# spec/mutations/update_modifier_spec.rb
require 'rails_helper'

RSpec.describe Mutations::UpdateModifierGroup, type: :request do
  describe '.resolve' do
    let(:modifier_group) { create(:modifier_group) }

    let(:mutation) do
      <<~GQL
        mutation($id: ID!, $selectionRequiredMin: Int!, $selectionRequiredMax: Int!, $label: String!) {
          updateModifierGroup(input: { id: $id, selectionRequiredMin: $selectionRequiredMin, selectionRequiredMax: $selectionRequiredMax, label: $label }) {
            modifierGroup {
              id
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
          id: modifier_group.id,
          label: "A new label",
          selectionRequiredMin: 1,
          selectionRequiredMax: 2
        }
      end

      it 'updates the modifier_group and returns the modifier_group details' do
        data = json_response['data']['updateModifierGroup']['modifierGroup']

        expect(data).to include(
          'id' => modifier_group.id.to_s,
          'label' => "A new label",
          'selectionRequiredMin' => 1,
          'selectionRequiredMax' => 2
        )
      end
    end

    context 'when the request has invalid inputs' do
      let(:variables) do
        {
          id: modifier_group.id,
          label: "A new label",
          selectionRequiredMin: 1,
          selectionRequiredMax: nil
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
        expect(errors.first['message']).to include('Variable $selectionRequiredMax of type Int! was provided invalid value')
      end
    end
  end
end
