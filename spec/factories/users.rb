FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
 
  sequence :name do |n|
    "person#{n}"
  end

  factory :user, :class => 'User' do
    name { generate :name }
    email { generate :email }
    password '12345678'
    password_confirmation '12345678'
  end
end

