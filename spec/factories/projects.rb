# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    public false
    owner_id 1
    title "MyString"
    description "MyText"
  end
end
