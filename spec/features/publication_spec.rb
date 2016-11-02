require 'rails_helper'

feature 'Publication', :feature do
	let(:user) { create(:user) }
	let(:admin) { create(:admin) }
	let(:publication) { build(:publication, user: @user) }
	let!(:publication2) { create(:publication, user: @user) }

	context 'login author' do
		before(:each) do
	    login_as user
		end

		it 'create publication' do
			visit root_path
			click_on 'create article'
	    fill_in 'Title', with: publication.title
	    fill_in 'Short description', with: publication.description
	    fill_in 'Description', with: publication.short_description
	    click_button 'Create Publication'
	    expect(page).to have_content publication.title
	  end

	  it 'edit publication' do
			visit edit_publication_path(publication2)
	    fill_in 'Title', with: '12345qwerty'
	    click_button 'Update Publication'
	    expect(page).to have_content '12345qwerty'
		end

		it 'redirect show page' do
			visit edit_publication_path(publication2)
			click_on('Back')
			expect(page).to have_content publication2.title
		end

	end

	it 'destroy publication' do
		login_as admin
		visit publication_path(publication2)
		find('.destroy_publication').click
		expect(page).to_not have_content publication2.title
	end

end
