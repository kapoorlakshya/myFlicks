class ImdbDatum < ActiveRecord::Base
  self.primary_key = "imdb_id"

  has_many :user_comments

  def self.search(query)
    if query =~ /\d{4}/
      where("year like ?", "%#{query}%")
    else
      where("title like ?", "%#{query}%")
    end
  end
end
