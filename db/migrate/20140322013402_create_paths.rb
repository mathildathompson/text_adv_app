class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths, :force => true do |t|
      t.integer "scene_id", :null => false
      t.integer "destination_id", :null => false
      t.text  "description"
    end
  end
end
