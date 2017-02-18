FactoryGirl.define do
  factory :post do
    category 
    title "Title"
    price "100"
    description "Description"
    deal "Sale"
    photo { File.new("#{Rails.root}/spec/fixtures/test.jpg") } 
    association :user, factory: :user, strategy: :build
  end
end