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

  def link(origin, destination, description)
    if origin.adventure_id != destination.adventure_id
      raise 'Scenes cannot be linked, they are not in the same adventure'
    elsif origin.class != Scene || destination.class != Scene
      raise 'Origin and Destination must be a class!'
    end

    #update the instance variables with ids and description
    self.origin_id = origin.id
    self.destination_id = destination.id
    self.description = description

    #save it
    self.save
  end

end
