require 'spec_helper'

describe "User signs up" do
  it "using valid email and password" do
    user = FactoryGirl.build(:user)
    sign_up_with(user.email, user.password)
    expect(page).to have_content("Sign Up Successful!")
  end
  it "using invalid email" do
    user = FactoryGirl.build(:user, email: nil)
    sign_up_with(user.email, user.password)
    expect(page).to have_content("User Sign Up Form is invalid")
  end
  it "using blank password" do
    user = FactoryGirl.build(:user, password: nil)
    sign_up_with(user.email, user.password)
    expect(page).to have_content("User Sign Up Form is invalid")
  end
end