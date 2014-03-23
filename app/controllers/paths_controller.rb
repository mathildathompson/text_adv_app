class PathsController < ApplicationController
  def new
    path = Path.new(:scene_id => params[:origin_id], :destination_id => params['destination_id'])
    path.description = params[:description]
    path.save

    redirect_to scene_path(params[:origin_id])
  end

  def destroy
    path = Path.find params[:id]
    origin = path.scene_id
    path.destroy

    redirect_to scene_path(origin)
  end
end