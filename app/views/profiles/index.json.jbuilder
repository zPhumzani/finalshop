json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :bio
  json.url profile_url(profile, format: :json)
end
