class CreateFlicks < ActiveRecord::Migration
  def change
    create_table :flicks do |t|
      t.string :flick_id
      t.integer :user_id
      t.timestamps
    end
  end
end
