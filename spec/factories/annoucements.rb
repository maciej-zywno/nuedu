# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :annoucement do
    course nil
    user nil
    title "MyString"
    content "MyText"
  end
end
