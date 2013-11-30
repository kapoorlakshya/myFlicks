class CreateImdbData < ActiveRecord::Migration
  def change
    create_table :imdb_data do |t|
      t.string :unique_id
      t.string :imdb_id
      t.string :title
      t.string :year
      t.string :release_date
      t.string :runtime
      t.string :genre
      t.text   :plot
      t.string :director
      t.string :writer
      t.string :rating
      t.string :poster
      t.string :actors
      t.float  :imdbrating
      t.string :flick_type

      t.timestamps
    end
  end
end
