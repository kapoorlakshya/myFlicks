class Flick < ActiveRecord::Base
  self.primary_key = "imdb_id"
  validates_uniqueness_of :imdb_id, :scope => :user_id, notice: "Already in your list!"
  belongs_to :user
end
