class Flick < ActiveRecord::Base
  self.primary_key = "imdb_id"
  belongs_to :user
end
