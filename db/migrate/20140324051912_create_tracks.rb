class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks, :force => true do |t|
      t.integer "origin_id", :null => false
      t.integer "destination_id", :null => false
      t.text  "description"
    end
  end
end