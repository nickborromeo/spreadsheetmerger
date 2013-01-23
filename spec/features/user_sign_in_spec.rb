require 'spec_helper'

describe "User Authentication" do
  context "successfully logged in" do
    let(:user) { FactoryGirl.create(:user)}
    
    it "with a valid existing email and password" do
      sign_in_with(user.email, user.password)
      expect(page).to have_content("Logged In")
    end
    
    it "with remember me checked" do
      fill_in_with(user.email, user.password)
      check "Remember me"
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
      invalid_user = FactoryGirl.build(:user, password: "secret")
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