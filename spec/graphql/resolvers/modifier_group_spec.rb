require 'rails_helper'

RSpec.describe Resolvers::ModifierGroup, type: :request do
  describe '#resolve' do
    let!(:modifier_group) { create(:modifier_group) }

    context 'when id is provided' do
      it 'returns the modifier group with the specified id' do
        query = <<-GRAPHQL
          query {
            modifierGroup(id: #{modifier_group.id}) {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        modifier_group_response = json_response['data']['modifierGroup']

        expect(modifier_group_response['id'].to_i).to eq(modifier_group.id)
      end
    end

    context 'when id is not provided' do
      it 'raises an error' do
        query = <<-GRAPHQL
          query {
            modifierGroup {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        errors = json_response['errors']

        expect(errors.size).to eq(1)
        expect(errors.first['message']).to eq("Field 'modifierGroup' is missing required arguments: id")
      end
    end
  end
end