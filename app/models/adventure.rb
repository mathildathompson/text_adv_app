# == Schema Information
#
# Table name: adventures
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  status      :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Adventure < ActiveRecord::Base
  #attributes
  attr_accessible :user_id, :name, :status, :description
  #relationships
  belongs_to :user
  has_many :scenes
end
