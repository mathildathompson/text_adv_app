class ScenesController < ApplicationController

  #must be logged in to use these functions
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  #must be the owner to use these functions
  before_filter :check_owner?, :only => [:update, :destroy]

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find params[:id]

    #to allow linking to other scenes in the same adventure
    adv_scenes = @scene.adventure.scenes.where("id <> #{@scene.id}")

    ##########################################
    ##### REFACTOR THIS WITH SELECT!!!!! #####
    ##########################################
    @link_options = []
    adv_scenes.each do |scene|
      unless @scene.destinations.include? scene
        @link_options.push [scene.title,scene.id]
      end #unless
    end #adv_scenes.each

    #find origin scenes
    @origins = @scene.origins

  end

  def edit
    @scene = Scene.find params[:id]
  end

  def update
    @scene = Scene.find params[:id]
    
    if @scene.update_attributes(params[:scene])
      redirect_to @scene
    else
      render 'update'
    end
  end

  def destroy
    scene = Scene.find(params[:id])
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

      #add the track to the new scene to the origin scene
      origin.destinations << @scene

      #get the track between the origin and this new scene so we can set its text
      track = origin.tracks.where("destination_id = ?",@scene.id).first
      track.description = params[:track_desc]
      track.save

      redirect_to @scene
    else
      render 'new'
    end
  end

  private
  #security to prevent updating if not your content
  def check_owner?
    scene = Scene.find(params[:id])
    redirect_to scene if scene.adventure.user_id != current_user.id 
  end

end