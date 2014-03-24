class TracksController < ApplicationController
  def create
    track = Track.new(:origin_id => params[:origin_id], :destination_id => params[:destination_id])
    track.description = params[:description]
    track.save

    redirect_to scene_path(params[:origin_id])
  end

  def destroy
    track = Track.find params[:id]
    origin = track.origin_id
    track.destroy

    redirect_to scene_path(origin)
  end
end