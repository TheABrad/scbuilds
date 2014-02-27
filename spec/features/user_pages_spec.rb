require 'spec_helper'

describe "UserPages" do
  describe "account creation" do
    it "allows user to creat account" do
      visit root_path 
      click_link 'Create Account'

      fill_in "Username", with: "ExampleUser"
      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "foobar"
      fill_in "Password confirmation", with: "foobar"
      
      expect(page).to have_content('Signed up successfully') 
    end
  end
end
