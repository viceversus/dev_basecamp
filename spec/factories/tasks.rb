# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    description "MyString"
    completed_at "2012-08-03 12:05:53"
    list_id 1
  end
end
