class UserComment < ActiveRecord::Base
  belongs_to :imdb_datum
  belongs_to :user

  validates_presence_of :comment
end
