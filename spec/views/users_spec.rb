require 'rails_helper'

RSpec.describe 'UsersController', type: :feature do
  describe 'index page' do
    it 'displays the welcome message' do
      visit users_path
      expect(page).to have_content('Welcome To Budget Guys!')
    end
  end
end
