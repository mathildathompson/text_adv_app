# == Schema Information
#
# Table name: adventures
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string(255)
#  status         :string(255)
#  description    :text
#  image          :text
#  start_scene_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Adventure < ActiveRecord::Base
  #attributes
  attr_accessible :user_id, :name, :description, :image, :status, :start_scene_id
  #relationships
  belongs_to :user
  has_many :scenes, :dependent => :destroy
  #validations
  validates :name, :presence => true
  validates :description, :presence => true
  #custom validation
  validate :publishable?

  def orphans
    orphans = self.scenes.select { |scene| scene.origins.empty? && scene.not_start? }
  end

  def dead_ends
    dead_ends = self.scenes.select { |scene| scene.destinations.empty? && scene.end == false }
  end

  #Validation Methods
  def publishable?
    if self.status == 'Published' && (self.dead_ends.any? || self.orphans.any?)
      errors.add(:status, "cannot be set to 'Published' if the Adventure contains 'Orphan' or 'Dead End' Scenes")
      #set the status to Draft if it cannot be Published
      self.status = 'Draft'
    end
  end

end
