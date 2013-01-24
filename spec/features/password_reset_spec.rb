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
  
  context "when resetting password" do
    
    it "password is reset when confirmation is matched" do
      user = FactoryGirl.create(:user, :password_reset_token => "secrettoken", :password_reset_sent_at => 1.hour.ago)
      visit edit_password_reset_path(user.password_reset_token)
      fill_in "user_password", with: "newpassword"
      fill_in "user_password_confirmation", with: "newpassword"
      click_button "Update Password"
      page.should have_content("Password Updated Successfully")
    end
    
    it "password not updated if confirmation does not match" do
      user = FactoryGirl.create(:user, password_reset_token: "secrettoken", password_reset_sent_at: 1.hour.ago)
      visit edit_password_reset_path(user.password_reset_token)
      fill_in "user_password", with: "newpassword"
      fill_in "user_password_confirmation", with: "wrongpassword"
      click_button "Update Password"
      page.should have_content("Password doesn't match confirmation")
    end
    
    it "reports when token is expired" do
      user = FactoryGirl.create(:user, password_reset_token: "secrettoken", password_reset_sent_at: 5.hours.ago)
      visit edit_password_reset_path(user.password_reset_token)
      fill_in "user_password", with: "newpassword"
      fill_in "user_password_confirmation", with: "newpassword"
      click_button "Update Password"
      page.should have_content("Password reset token expired")
    end
    
    it "raises record not found when token is invalid" do
      expect { visit edit_password_reset_path("invalid_token") }.to raise_error
    end
  end
  
end