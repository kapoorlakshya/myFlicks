class CreateAllFlicks < ActiveRecord::Migration
  def change
    create_table :all_flicks do |t|

      t.timestamps
    end
  end
end
