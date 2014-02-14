# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_result do
    exam_progress nil
    question nil
    answer nil
  end
end
