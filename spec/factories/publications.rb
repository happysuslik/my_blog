FactoryGirl.define do
  factory :publication do
    user nil
    title "MyString"
    description "MyText"
    avatar "MyString"
  end

  factory :invalid_publication, class: "Publication" do
  	title nil
  	description nil
  end
end
