require 'spec_helper'

describe 'UserPages' do
  describe 'account creation' do
    it 'allows user to create account' do
      visit new_user_registration_path

      fill_in 'Username', with: 'ExampleUser'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'foobarbaz'
      fill_in 'Password confirmation', with: 'foobarbaz'

      expect { click_button 'Sign up' }.to change(User, :count).by(1)
    end
  end
end
