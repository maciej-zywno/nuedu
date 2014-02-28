json.array!(@announcements) do |announcement|
  json.extract! announcement, :id, :course_id, :user_id, :title, :content
  json.url announcement_url(announcement, format: :json)
end
