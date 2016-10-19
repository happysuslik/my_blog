require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_confirmation_of :password }
  it { should validate_length_of :password }
  it { should have_many :publications }

  it 'validates format of email' do
  	expect(User.create(email: "qwe", password: "123456")).to_not be_valid
  	expect(User.create(email: "qwe@test.ua", password: "123456")).to be_valid
  end
end
