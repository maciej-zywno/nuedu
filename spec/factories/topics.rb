# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    forum nil
    user nil
    title "MyString"
    body "MyText"
  end
end
