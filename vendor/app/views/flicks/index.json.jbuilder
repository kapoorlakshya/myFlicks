json.array!(@flicks) do |flick|
  json.extract! flick, :imdb_id, :user_id
  json.url flick_url(flick, format: :json)
end
