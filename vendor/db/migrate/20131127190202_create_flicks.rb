class CreateFlicks < ActiveRecord::Migration
  def change
    create_table :flicks do |t|
      t.string :imdb_id
      t.integer :user_id
      t.string :unique_id     
  
      t.timestamps
    end
  end
end
