require 'rails_helper'

RSpec.describe Mutations::CreateSection, type: :request do
  describe '.resolve' do
    let(:mutation) do
      <<~GQL
        mutation($identifier: String!, $label: String!, $description: String!) {
          createSection(input: { identifier: $identifier, label: $label, description: $description }) {
            section {
              identifier
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
          identifier: "Section-123",
          label: "Section Label",
          description: "Test description"
        }
      end

      it 'creates a new section and returns the section details' do
        data = json_response['data']['createSection']['section']

        expect(data).to include(variables.with_indifferent_access)
      end
    end

    context 'when the request is missing required fields' do
      let(:variables) do
        {
        }
      end

      it 'returns an error' do
        errors = json_response['errors']

        expect(errors).not_to be_empty
      end
    end
  end
end