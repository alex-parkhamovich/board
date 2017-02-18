FactoryGirl.define do
  sequence :title do |n|
    "category_title#{n}"
  end

  factory :category, class: "Category" do
    title { generate :title }
  end
end