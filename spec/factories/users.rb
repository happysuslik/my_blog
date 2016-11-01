FactoryGirl.define do
  factory :user do
    email "test@gmal.com"
    password "12345678"
  end

  factory :admin, class: "User" do
  	email "admin@gmail.com"
  	password "12345678"
  	admin "true"
  end
end
