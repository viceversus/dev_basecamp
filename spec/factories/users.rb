# Read about factories at https://github.com/thoughtbot/factory_girl
require 'ffaker'

FactoryGirl.define do
  factory :user, aliases: [:owner, :member] do
    email { Faker::Internet.email }
    password "pizza1"
    password_confirmation "pizza1"
    username { Faker::Name.name.gsub(/\W/, "") }
  end
end

