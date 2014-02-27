json.array!(@reviews) do |review|
  json.extract! review, :id, :content, :user_id, :course_id, :stars, :status
  json.url review_url(review, format: :json)
end
