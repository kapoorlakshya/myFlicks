class ImdbDatum < ActiveRecord::Base
  self.primary_key = "imdb_id"

  validates :imdb_id, uniqueness: true
end
