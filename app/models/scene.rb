# == Schema Information
#
# Table name: scenes
#
#  id           :integer          not null, primary key
#  adventure_id :integer
#  title        :string(255)
#  first_visit  :text
#  description  :text
#  image        :text
#  end          :boolean
#  multi_visit  :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class Scene < ActiveRecord::Base
  #attributes
  attr_accessible :title, :first_visit, :description, :image, :end, :multi_visit, :adventure_id
  #relationships
  belongs_to :adventure
  has_and_belongs_to_many :destinations, class_name: "Scene", 
                                         join_table: "scene_destinations",
                                         association_foreign_key: "destination_id"
end
