json.array!(@imdb_data) do |imdb_datum|
  json.extract! imdb_datum, :imdb_id, :title, :year, :release_date, :runtime, :genre, :plot, :poster, :rating, :type
  json.url imdb_datum_url(imdb_datum, format: :json)
end
