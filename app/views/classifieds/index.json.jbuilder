json.array!(@classifieds) do |classified|
  json.extract! classified, :id, :title, :price, :location, :description, :filename, :content_type, :file_contents, :category_id, :user_id, :slug
  json.url classified_url(classified, format: :json)
end
