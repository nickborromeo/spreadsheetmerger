require 'spec_helper'

describe "Password Reset" do
  context "when requesting password reset" do
    
    it "password link redirects to correct page" do
      visit login_path
      click_link "Password"
      page.should have_content("Password Reset")
    end
    
    it "email is sent" do
        user = FactoryGirl.create(:user)
        visit new_password_reset_path
        fill_in "Email", with: user.email
        click_button "Reset Password"
        page.should have_content("Email sent")
        last_email.to.should include(user.email)
    end
    
    it "email is not sent with invalid user" do
      visit new_password_reset_path
      fill_in "Email", with: "nonvalidemail@example.com"
      click_button "Reset Password"
      page.should have_content("Email sent")
      last_email.should be_nil
    end
  end
  
end