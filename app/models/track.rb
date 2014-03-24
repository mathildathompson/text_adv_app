# == Schema Information
#
# Table name: tracks
#
#  id             :integer          not null, primary key
#  origin_id      :integer          not null
#  destination_id :integer          not null
#  description    :text
#

class Track < ActiveRecord::Base
  #attributes
  attr_accessible :origin_id, :destination_id, :description
  
  #relationships
  belongs_to :origin, :class_name => :Scene
  belongs_to :destination, :class_name => :Scene

end
