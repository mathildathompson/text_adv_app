# == Schema Information
#
# Table name: paths
#
#  id             :integer          not null, primary key
#  scene_id       :integer          not null
#  destination_id :integer          not null
#  description    :text
#

class Path < ActiveRecord::Base
  belongs_to :scene, :class_name => :Scene
  belongs_to :destination, :class_name => :Scene
end
