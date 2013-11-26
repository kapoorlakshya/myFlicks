class Flick < ActiveRecord::Base
  self.primary_key = "flick_id"

  belongs_to :user
  has_one :imdb_data, through: :imdb_data, foreign_key: :imdb_id
end
