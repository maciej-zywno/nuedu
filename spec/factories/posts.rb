# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    topic nil
    user nil
    body "MyText"
  end
end
