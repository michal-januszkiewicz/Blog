class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :text
      t.string :title

      t.timestamps null: false
    end
  end
end
