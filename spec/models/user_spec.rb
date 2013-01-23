require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "invalid without an email address" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end
  it "invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end
  it "password cannot be too short" do
    FactoryGirl.build(:user, password: "123").should_not be_valid
  end
  it "email needs to be unique" do
    user = FactoryGirl.create(:user)
    FactoryGirl.build(:user, email: user.email).should_not be_valid
  end
  
  context "#send_password_reset" do
    let(:user) {FactoryGirl.create(:user)}
    it "generates a unique token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end
    it "saves when password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end
    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end
end