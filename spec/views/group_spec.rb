require 'rails_helper'

RSpec.describe 'groups/new', type: :feature do
  before(:each) do
    @user = User.create(name: 'Htet', email: '123abc@gmail.com', password: '123456')
    unless @user.persisted?
      puts @user.errors.full_messages
    end

    if @user.persisted?
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    else
      puts 'User not saved successfully'
    end
  end

  describe 'Visit group\'s index page when no categories exist' do
    it 'should display a message prompting to add a category' do
      visit user_groups_path(@user)

      expect(page).to have_css('span.d-flex.justify-content-center.align-items-center.shadow.p-3.mb-5.bg-body.rounded.p-5', text: 'You have no categories click Add Category to continue')
    end
  end

  describe 'Visit group\'s index page' do
    before(:each) do
      @group = @user.groups.create(name: 'Vacation', icon: 'https://unsplash.com/photos/KVym2PAn1gA')
    end

    it 'should have a group name' do
      visit user_groups_path(@user)
      expect(page).to have_content('Vacation')
    end
  end
end
