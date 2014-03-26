class ScenesController < ApplicationController

  #must be logged in to use these functions
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  #must be the owner of the adventure to use these functions
  before_filter :check_owner?, :only => [:edit, :update, :destroy]
  #if adventure is in 'Draft' status, you must be the owner to view any scenes
  before_filter :check_published?, :only => [:show]

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find params[:id]

    @track_options = []
    #reformat new track options as an array
    @scene.new_track_options.each do |scene|
      @track_options.push [scene.title,scene.id]
    end

  end

  def edit
    @scene = Scene.find params[:id]
  end

  def update
    @scene = Scene.find params[:id]
    
    if @scene.update_attributes(params[:scene])

      #if this has now been set as an end scene, destroy all it's paths
      @scene.tracks.destroy_all if @scene.end

      redirect_to @scene
    else
      render 'update'
    end
  end

  def destroy
    scene = Scene.find(params[:id])

    raise "Cannot delete the first scene in an adventure" if scene.id = scene.adventure.start_scene_id

    adv = scene.adventure
    scene.destroy

    redirect_to adv
  end

  #----------------NON-STANDARD-CRUD----------------

  def new
    @scene = Scene.new

    @origin = Scene.find params[:origin_id]
  end

  def create
    #create a new scene
    @scene = Scene.new(params[:scene])

    #find the origin to this scene for linking (a track)
    origin = Scene.find params[:origin_id]

    #add the scene to the same adventure as the origin
    @scene.adventure = origin.adventure

    if @scene.save

      # #add a track from the origin scene to the new scene
      track = Track.new
      track.link(origin, @scene, params[:track_desc])

      redirect_to @scene
    else
      render 'new'
    end
  end

  private
  #security to prevent updating if not your content
  def check_owner?
    scene = Scene.find(params[:id])
    redirect_to scene_path if scene.adventure.user != current_user
  end

  def check_published?
    scene = Scene.find(params[:id])
    redirect_to adventures_path if scene.adventure.status == 'Draft' && scene.adventure.user != current_user
  end

end