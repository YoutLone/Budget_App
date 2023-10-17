require 'rails_helper'

RSpec.describe 'UsersController', type: :feature do
  describe 'index page' do
    it 'displays the welcome message' do
      visit users_path
      expect(page).to have_content('Welcome To Budget Guys!')
    end

    it 'has a link to create a new user' do
      visit users_path
      expect(page).to have_link('Sign up', href: new_user_registration_path)
    end

    it 'has a link to log in' do
      visit users_path
      expect(page).to have_link('Log in', href: new_user_session_path)
    end

    it 'redirects to the login page when Log in button is clicked' do
      visit users_path
      click_link 'Log in'
      expect(current_path).to eq(new_user_session_path)
    end

    it 'redirects to the registration page when Sign up button is clicked' do
      visit users_path
      click_link 'Sign up'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
