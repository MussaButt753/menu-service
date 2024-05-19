require 'rails_helper'

RSpec.describe Resolvers::Menu, type: :request do
  describe '#resolve' do
    let!(:menu) { create(:menu) }

    context 'when id is provided' do
      it 'returns the menu with the specified id' do
        query = <<-GRAPHQL
          query {
            menu(id: #{menu.id}) {
              id
              label
              # Include other fields as needed
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        menu_response = json_response['data']['menu']

        expect(menu_response['id'].to_i).to eq(menu.id)
      end
    end

    context 'when id is not provided' do
      it 'raises an error' do
        query = <<-GRAPHQL
          query {
            menu {
              id
            }
          }
        GRAPHQL

        post '/graphql', params: { query: query }
        errors = json_response['errors']

        expect(errors.size).to eq(1)
        expect(errors.first['message']).to eq("Field 'menu' is missing required arguments: id")
      end
    end
  end
end