# == Schema Information
#
# Table name: adventures
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  status     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Adventure < ActiveRecord::Base
  #attributes
  attr_accessible :name, :status, :user_id
  #relationships
  belongs_to :user
  has_many :scenes
end
