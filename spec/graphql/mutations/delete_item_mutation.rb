# spec/mutations/delete_item_spec.rb
require 'rails_helper'

RSpec.describe Mutations::DeleteItem, type: :request do
  describe '.resolve' do
    let!(:item) { create(:item) }

    let(:mutation) do
      <<~GQL
        mutation($id: ID!) {
          deleteItem(input: { id: $id }) {
            success
          }
        }
      GQL
    end

    context 'when the item exists' do
      it 'deletes the item and returns success' do
        variables = { id: item.id }

        expect {
          post graphql_path, params: { query: mutation, variables: variables }
        }.to change { Item.count }.by(-1)

        json_response = JSON.parse(response.body)
        data = json_response['data']['deleteItem']

        expect(data).to include('success' => true)
      end
    end

    context 'when the item does not exist' do
      it 'returns success as false' do
        variables = { id: 'nonexistent-id' }

        post graphql_path, params: { query: mutation, variables: variables }

        json_response = JSON.parse(response.body)
        data = json_response['data']['deleteItem']

        expect(data).to include('success' => false)
      end
    end
  end
end
