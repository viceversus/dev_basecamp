# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "b@b.com"
    password "pizzas"
    password_confirmation "pizzas"
    username "bill"
  end
end
