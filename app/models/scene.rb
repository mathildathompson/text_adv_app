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
  has_many :destinations, :through => :paths, :source => :destination

  has_many(:reverse_paths, :class_name => :Path,
      :foreign_key => :destination_id, :dependent => :destroy)

end
