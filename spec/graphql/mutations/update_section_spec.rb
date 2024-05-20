# spec/mutations/update_section_spec.rb
require 'rails_helper'

RSpec.describe Mutations::UpdateSection, type: :request do
  describe '.resolve' do
    let(:section) { create(:section) }

    let(:mutation) do
      <<~GQL
        mutation($id: ID!, $label: String!, $description: String) {
          updateSection(input: { id: $id, label: $label, description: $description }) {
            section {
              id
              label
              description
            }
          }
        }
      GQL
    end

    before { make_graphql_request(query: mutation, variables:) }

    context 'when the request is valid' do
      let(:variables) do
        {
          id: section.id,
          label: 'Updated Label',
          description: 'Updated Description'
        }
      end

      it 'updates the section and returns the section details' do
        data = json_response['data']['updateSection']['section']

        expect(data).to include(
          'id' => section.id.to_s,
          'label' => 'Updated Label',
          'description' => 'Updated Description'
        )
      end
    end

    context 'when the request has invalid inputs' do
      let(:variables) do
        {
          id: section.id,
          label: '',
          description: 'Updated Description'
        }
      end

      it 'returns an error' do
        expect(json_response['exception']).not_to be_blank
      end
    end
  end
end
