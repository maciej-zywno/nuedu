# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :video do
    title "MyString"
    description "MyString"
    yt_id "MyString"
    complete false
  end
end
