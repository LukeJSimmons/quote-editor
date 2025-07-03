require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe 'line_items', type: :system, js: true do
  include ActionView::Helpers::NumberHelper

  let(:company) { create(:company) }
  let!(:user) { create(:user) }
  let!(:quote) { create(:quote, company: user.company) }
  let(:line_item_date) { create(:line_item_date, quote: quote) }
  let(:line_item) { create(:line_item, line_item_date: line_item_date) }

  before do
    login_as user
    visit quote_path(quote)
  end

  describe 'creating a line item' do
    before do
      within "##{dom_id(line_item_date)}" do
        click "Add item", match: :first
      end
    end

    it 'stays on quote page' do
      expect(page).to have_content(quote.name)
    end
  end
end
