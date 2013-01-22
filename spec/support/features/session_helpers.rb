module Features
  module SessionHelpers 
    def sign_up_with(email, password) 
      visit signup_path
      fill_in 'Email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'Sign Up'
    end
    
    def sign_in_with(email, password)
      visit new_session_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign In"
    end
    
    def fill_in_with(email, password) 
      visit new_session_path
      fill_in "Email", with: email
      fill_in "Password", with: password
    end
  end
end