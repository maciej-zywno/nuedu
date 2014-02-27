# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    content "MyText"
    user nil
    course nil
    stars 1
    status "MyString"
  end
end
