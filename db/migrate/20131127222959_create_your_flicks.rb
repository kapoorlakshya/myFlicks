class CreateYourFlicks < ActiveRecord::Migration
  def change
    create_table :your_flicks do |t|

      t.timestamps
    end
  end
end
