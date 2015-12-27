class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :text
      t.string :title

      t.timestamps null: false
    end
  end
end
