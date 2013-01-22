require 'spec_helper'

describe "User Authentication" do
  context "successfully logged in" do
    it "with a valid existing email and password" do
      user = FactoryGirl.create(:user)
      visit new_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign In"
      expect(page).to have_content("Logged In")
    end
  end
  
  context "invalid login" do
    it "when password is blank" do
      user = FactoryGirl.build(:user, password: nil)
      sign_in_with(user.email, user.password)
      expect(page).to have_content("Invalid email or password")
    end
    it "when email is blank" do
      user = FactoryGirl.build(:user, email: nil)
      sign_in_with(user.email, user.password)
      expect(page).to have_content("Invalid email or password")
    end
    it "when email and password do not match" do
      user = FactoryGirl.create(:user)
      invalid_user = FactoryGirl.build(:user, password: "secretpassword")
      sign_in_with(user.email, invalid_user.password)
      expect(page).to have_content("Invalid email or password")
    end
  end
  
  it "successful log out" do
    user = FactoryGirl.create(:user)
    sign_in_with(user.email, user.password)
    click_link "Log Out"
    expect(page).to have_content("Logged Out") 
  end
end