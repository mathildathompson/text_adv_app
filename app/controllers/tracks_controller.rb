class TracksController < ApplicationController
  # before_filter :check_editable?

  def create
    #prevent creation of new Tracks if Adventure is Published
    scene = Scene.find(params[:origin_id])
    return redirect_to scene_path(params[:origin_id]) if scene.adventure.status == 'Published'

    #create our track
    track = Track.new(:origin_id => params[:origin_id], :destination_id => params[:destination_id])
    track.description = params[:description]
    track.save

    redirect_to scene_path(params[:origin_id])
  end

  def destroy
    track = Track.find params[:id]

    #prevent deletion of Tracks if Adventure is Published
    scene = track.origin
    return redirect_to scene_path(scene) if scene.adventure.status == 'Published'

    #delete our track
    origin = track.origin_id
    track.destroy

    redirect_to scene_path(origin)
  end
end