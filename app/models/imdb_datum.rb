class ImdbDatum < ActiveRecord::Base
  self.primary_key = "imdb_id"

  has_many :user_comments
end
