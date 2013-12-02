json.array!(@user_comments) do |user_comment|
  json.extract! user_comment, :user_id, :imdb_id, :comment
  json.url user_comment_url(user_comment, format: :json)
end
