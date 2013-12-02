class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.string :user_email
      t.string :imdb_datum_id
      t.text :comment

      t.timestamps
    end
  end
end
