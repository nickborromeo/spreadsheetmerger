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
end