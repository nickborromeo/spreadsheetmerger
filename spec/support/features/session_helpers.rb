module Features
  module SessionHelpers 
    def sign_up_with(email, password) 
      visit signup_path
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign Up'
    end
  end
end