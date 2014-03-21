class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.integer :adventure_id
      t.string :title
      t.text :first_visit
      t.text :description
      t.text :image
      t.boolean :end
      t.boolean :multi_visit
      t.timestamps
    end
  end
end
