require	'rails_helper'

feature 'the sign in processing', :feature do 

	before(:each) do
		@user = create(:user)
		@admin = create(:admin)
	end

	it 'sign out' do
		sign_in_with(@user.email, @user.password)
		click_on 'Sign out'
		expect(page).to have_content 'Sign up'
	end

	it 'sign_in_user' do
    sign_in_with(@user.email, @user.password)
    expect(page).to have_content 'create article'
    expect(page).to have_no_content 'admin panel'
    click_on 'Sign out'
  end

  it 'return to home page' do
    sign_in_with(@user.email, @user.password)
    click_link 'Home'
    expect(page).to have_content 'create article'
  end

  context 'visit admin' do
    before do
      sign_in_with(@admin.email, @admin.password)
    end

    it 'sign_in_admin' do
      expect(page).to have_content 'Admin Panel'
    end

    it 'visit admin panel' do
      click_link 'Admin Panel'
      expect(page).to have_content 'Admin Page'
    end
end


end