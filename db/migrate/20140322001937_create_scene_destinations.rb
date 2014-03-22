class CreateSceneDestinations < ActiveRecord::Migration
  def change
    create_table :scene_destinations, :id => false do |t|
      t.integer :scene_id
      t.integer :destination_id
    end
  end
end
