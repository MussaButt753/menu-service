require "rails_helper"

RSpec.describe Resolvers::Sections, type: :request do
  describe '#resolve' do
    let!(:menu1) { create(:menu) }
    let!(:menu2) { create(:menu) }
    let!(:section1) { create(:section, label: 'Section 1', menu: menu1) }
    let!(:section2) { create(:section, label: 'Section 2', menu: menu2) }
    let!(:section3) { create(:section, label: 'Another Section', menu: menu1) }

    before { make_graphql_request(query:) }

    context 'when label and menu_id are provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            sections(label: "Section 1", menuId: #{menu1.id}) {
              label
            }
          }
        GRAPHQL
      end

      it 'returns sections with the specified label and menu_id' do
        sections = json_response['data']['sections']

        expect(sections.size).to eq(1)
        expect(sections.first['label']).to eq('Section 1')
      end
    end

    context 'when label and menu_id are not provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            sections {
              label
            }
          }
        GRAPHQL
      end

      it 'returns all sections' do
        sections = json_response['data']['sections']

        expect(sections.size).to eq(3) # Assuming we have 3 sections created
      end
    end

    context 'when page and limit are provided' do
      let(:query) do
        <<-GRAPHQL
          query {
            sections(page: 1, limit: 2) {
              label
            }
          }
        GRAPHQL
      end
      it 'returns paginated sections' do
        sections = json_response['data']['sections']

        expect(sections.size).to eq(2)
      end
    end
  end
end
