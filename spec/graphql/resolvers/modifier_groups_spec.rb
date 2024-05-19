require 'rails_helper'

RSpec.describe Resolvers::ModifierGroups, type: :request do
  describe '#resolve' do
    let!(:modifier_group1) { create(:modifier_group) }
    let!(:modifier_group2) { create(:modifier_group) }
    let!(:modifier_group3) { create(:modifier_group) }

    context 'when page and limit are provided' do
      it 'returns paginated modifier groups' do
        query = <<-GRAPHQL
          query {
            modifierGroups(page: 1, limit: 2) {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        json_response = JSON.parse(response.body)
        modifier_groups = json_response['data']['modifierGroups']

        expect(modifier_groups.size).to eq(2)
      end
    end

    context 'when page and limit are not provided' do
      it 'returns all modifier groups' do
        query = <<-GRAPHQL
          query {
            modifierGroups {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        json_response = JSON.parse(response.body)
        modifier_groups = json_response['data']['modifierGroups']

        expect(modifier_groups.size).to eq(3) # Assuming we have 3 modifier groups created
      end
    end
  end
end
