FactoryGirl.define do
  factory :user do
    first_name "Kiran"
    last_name  "Shahbaz"
      sequence :email do |n|
        "kiran#{n}@gmail.com"
      end
    password "1234"
  end
end