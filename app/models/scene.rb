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
  #self-join relationships
  has_many(:paths, :foreign_key => :scene_id, :dependent => :destroy)
  has_many(:destinations, :through => :paths, :source => :destination)

  has_many(:reverse_paths, :class_name => :Path, :foreign_key => :destination_id, :dependent => :destroy)
  #Scene Model has a method called "origins" to find scenes with paths to the current scene

  #validations
  validates :title, :presence => true
  validates :description, :presence => true

  #-------------------------------------------------------------------
  
  #returns the origin scenes (scenes with a path to the current scene)
  def origins
    #returns an array of the origin scene ids
    origin_ids = Path.where("destination_id = #{self.id}").pluck(:scene_id)
    #find the origin scenes
    origins = Scene.where(:id => origin_ids)
  end

  #returns true if this scene is the start of an adventure
  def start?
    @start = self.adventure.start_scene_id == self.id
  end

  def not_start?
    @not_start = self.adventure.start_scene_id != self.id
  end

end
