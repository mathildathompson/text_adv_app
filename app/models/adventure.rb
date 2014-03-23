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

  # no_whitespace = /\A[\S]\z/i
  # validates :customurl,  :format => { :with => no_whitespace }
end
