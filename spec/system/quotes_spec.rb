require 'rails_helper'

RSpec.describe 'quotes', type: :system do
  before do
    @quote = create(:quote)
  end

  describe 'creating a quote' do
    before do
      visit quotes_path
    end

    it 'has a title' do
      expect(page).to have_content("Quotes")
    end

    it 'redirects to new page' do
      click_on "New quote"
      expect(page).to have_content("New quote")
    end

    it 'creates quote' do
      click_on "New quote"
      fill_in "Name", with: "Capybara quote"
      click_on "Create quote"
      expect(page).to have_content("Capybara quote")
    end
  end

  describe 'showing a quote' do
    before do
      visit quotes_path
      click_on @quote.name
    end

    it 'shows the quote' do
      expect(page).to have_content(@quote.name)
    end
  end

  describe 'updating a quote' do
    before do
      visit quotes_path
      click_on @quote.name
      click_on "Edit"
    end

    it 'redirects to edit page' do
      expect(page).to have_content("Edit quote")
    end

    it 'updates quote' do
      fill_in "Name", with: "Updated quote"
      click_on "Update quote"

      expect(page).to have_content("Updated quote")
    end
  end

  describe 'destroying a quote' do
    before do
      visit quotes_path
      click_on @quote.name
    end

    it 'deletes quote' do
      expect(page).to have_content(@quote.name)
      click_on "Delete", match: :first
      expect(page).to_not have_content(@quote.name)
    end
  end
end
