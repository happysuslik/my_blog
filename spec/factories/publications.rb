FactoryGirl.define do
  factory :publication do
    user nil
    title "MyString"
    description "MyText"
    avatar "MyString"
    short_description "Short"
  end

  factory :invalid_publication, class: "Publication" do
  	title nil
  	description nil
    short_description nil
  end
end
