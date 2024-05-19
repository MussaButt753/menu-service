
require 'rails_helper'

RSpec.describe Resolvers::Menus, type: :request do
  describe '#resolve' do
    let!(:menu1) { create(:menu, label: 'Menu 1') }
    let!(:menu2) { create(:menu, label: 'Menu 2') }
    let!(:menu3) { create(:menu, label: 'Another Menu') }

    before { make_graphql_request(query:) }

    context 'when label is provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            menus(label: "Menu 1") {
              label
            }
          }
        GRAPHQL
      end

      it 'returns menus with the specified label' do
        menus = json_response['data']['menus']

        expect(menus.size).to eq(1)
        expect(menus.first['label']).to eq('Menu 1')
      end
    end

    context 'when label is not provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            menus {
              label
            }
          }
        GRAPHQL
      end

      it 'returns all menus' do
        menus = json_response['data']['menus']

        expect(menus.size).to eq(3) # Assuming we have 3 menus created
      end
    end

    context 'when page and limit are provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            menus(page: 1, limit: 2) {
              label
            }
          }
        GRAPHQL
      end
    
      it 'returns paginated menus' do
        menus = json_response['data']['menus']

        expect(menus.size).to eq(2)
      end
    end
  end
end