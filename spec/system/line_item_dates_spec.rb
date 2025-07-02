require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "line_item_dates", type: :system, js: true do
  let!(:company) { create(:company) }
  let!(:user) { create(:user) }
  let!(:quote) { create(:quote, company: company) }

  before do
    login_as user
    visit quotes_path
    click_on "New quote"
    fill_in "Name", with: quote.name
    click_on "Create quote"
    click_on quote.name
  end

  describe 'creating a date' do
    before do
      click_on "New date"
    end

    it 'stays on quote page' do
      expect(page).to have_content(quote.name)
    end

    it 'creates a date' do
      fill_in "Date", with: Date.current + 1.day
      click_on "Create date"
      expect(page).to have_content(I18n.l(Date.current + 1.day, format: :long))
    end
  end

  describe 'updates a date' do
    before do
      click_on "New date"
      fill_in "Date", with: Date.current + 1.day
      click_on "Create date"

      click_on "Edit"
    end

    it 'stays on quote page' do
      expect(page).to have_content(quote.name)
    end

    it 'updates date' do
      fill_in "Date", with: Date.current + 2.day
      click_on "Update date"
      expect(page).to have_content(I18n.l(Date.current + 2.day, format: :long))
    end
  end

  describe 'detroying a date' do
    before do
      click_on "New date"
      fill_in "Date", with: Date.current + 1.day
      click_on "Create date"
    end

    it 'deletes date' do
      expect(page).to have_content(I18n.l(Date.current + 1.day, format: :long))
      accept_confirm do
        click_on "Delete"
      end
      expect(page).to have_no_content(I18n.l(Date.current + 1.day, format: :long))
    end
  end
end
