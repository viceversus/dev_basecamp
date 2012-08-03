# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    restricted false
    sequence(:title) {|n| "New Title #{n}" }
    sequence(:description) {|n| "New Description #{n}" }
    owner
  end
end