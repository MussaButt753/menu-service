require 'rails_helper'

RSpec.describe Resolvers::Section, type: :request do
  describe '#resolve' do
    let!(:section) { create(:section) }

    context 'when id is provided' do
      it 'returns the section with the specified id' do
        query = <<-GRAPHQL
          query {
            section(id: #{section.id}) {
              id
              label
              # Include other fields as needed
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        section_response = json_response['data']['section']

        expect(section_response['id'].to_i).to eq(section.id)
      end
    end

    context 'when id is not provided' do
      it 'raises an error' do
        query = <<-GRAPHQL
          query {
            section {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        errors = json_response['errors']

        expect(errors.size).to eq(1)
        expect(errors.first['message']).to eq("Field 'section' is missing required arguments: id")
      end
    end
  end
end
