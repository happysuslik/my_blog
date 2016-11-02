require 'rails_helper'

feature 'Registration processing', :feature do
  before(:each) do
    @user = build(:user)
  end

  it 'registration user valid' do
    registration_with(@user.email, @user.password, @user.password)
    expect(page).to have_content 'create article'
  end

  it 'not registration user and get msg error' do
    registration_with(@user.email, @user.password, "09876543")
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

end
