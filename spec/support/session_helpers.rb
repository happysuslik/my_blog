require 'rails_helper'

module MyModel
  module SessionHelpers

    def sign_in_with(email, password)
      visit root_path
      click_on 'Sign in'
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    def registration_with(email, password, password_confirm)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'user[password_confirmation]', with: password_confirm
      click_button 'Sign up'
    end

  end
end