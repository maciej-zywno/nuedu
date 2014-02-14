# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exam_progress do
    exam nil
    step_progress nil
  end
end
