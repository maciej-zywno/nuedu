# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :participation do
    user nil
    course nil
    status "MyString"
  end
end
