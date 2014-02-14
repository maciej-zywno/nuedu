# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :step_progress do
    step nil
    course_progress nil
    last_watched_video nil
    last_watched_video_exam false
  end
end
