class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.integer :adventure_id
      t.string :title
      t.text :description
      t.text :image
      t.boolean :end
      t.timestamps
    end
  end
end
