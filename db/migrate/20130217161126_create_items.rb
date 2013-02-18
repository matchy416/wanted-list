class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :type
      t.string :title
      t.text :description
      t.string :image
      t.string :link

      t.timestamps
    end
    add_index :items, :user_id
  end
end
