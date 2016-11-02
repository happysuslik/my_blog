require 'rails_helper'

feature 'Admin', :feature do
	
	let(:admin) { create :admin }
	let!(:user) { create :user }
	let(:user2) { build :user, email: "test200@gmail.com" }

	before :each do
		login_as admin
		visit users_path
	end

	it 'admin panel' do
		expect(page).to have_content user.email 
	end

	it 'create user' do
		click_link 'create new user' 
		fill_in 'Email', with: "test100@gmail.com"
		fill_in 'Password', with: "12345678"
		click_button 'Create User' 
		expect(page).to have_content "test100@gmail.com" 
	end

	it 'destroy user' do
		click_link 'create new user' 
		fill_in 'Email', with: user2.email
		fill_in 'Password', with: user2.password
		click_button 'Create User'
		find(".desktop_user_#{User.last.id}").click
		expect(page).to_not have_content user2.email
	end

end