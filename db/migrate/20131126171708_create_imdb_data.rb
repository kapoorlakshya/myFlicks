class CreateImdbData < ActiveRecord::Migration
  def change
    create_table :imdb_data do |t|
      t.string :imdb_id
      t.string :title
      t.string :year
      t.string :release_date
      t.string :runtime
      t.string :genre
      t.text :plot
      t.string :poster
      t.float :rating
      t.string :type

      t.timestamps
    end
  end
end
