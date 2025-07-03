require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe 'line_items', type: :system, js: true do
  include ActionView::Helpers::NumberHelper

  let!(:company) { create(:company) }
  let!(:user) { create(:user) }
  let!(:quote) { create(:quote, company: user.company) }
  let!(:line_item_date) { create(:line_item_date, quote: quote) }
  let!(:line_item) { create(:line_item, line_item_date: line_item_date) }

  before do
    login_as user
    visit quote_path(quote)
  end

  describe 'creating a line item' do
    before do
      within "##{dom_id(line_item_date)}" do
        click_on "Add item", match: :first
      end
    end

    it 'stays on quote page' do
      expect(page).to have_content(quote.name)
    end

    it 'creates a line item' do
      fill_in "Name", with: line_item.name
      fill_in "Quantity", with: line_item.quantity
      fill_in "Unit price", with: line_item.unit_price
      click_on "Create item"
      expect(page).to have_content(line_item.name)
    end
  end

  describe 'updating a line item' do
    before do
      within "##{dom_id(line_item)}" do
        click_on "Edit"
      end
    end

    it 'stays on quote page' do
      expect(page).to have_content(quote.name)
    end

    it 'creates a line item' do
      fill_in "Name", with: "New name"
      fill_in "Unit price", with: 55555
      click_on "Update item"
      expect(page).to have_content("New name")
    end
  end

  describe 'destroying a line item' do
    it 'deletes a line item' do
      within "##{dom_id(line_item_date)}" do
        expect(page).to have_content(line_item.name)
      end

      within "##{dom_id(line_item)}" do
        click_on "Delete"
      end

      within "##{dom_id(line_item_date)}" do
        expect(page).to have_no_content(line_item.name)
      end
    end
  end
end
