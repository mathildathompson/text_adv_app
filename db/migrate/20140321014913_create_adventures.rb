class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.integer :user_id
      t.string :name
      t.string :status
      t.text :description
      t.text :image
      t.timestamps
    end
  end
end
