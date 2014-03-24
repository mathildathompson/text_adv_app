class ScenesController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find params[:id]

    #to allow linking to other scenes in the same adventure
    adv_scenes = @scene.adventure.scenes.where("id <> #{@scene.id}")

    #how to exclude scenes that this scene already links to?
    @link_options = []
    adv_scenes.each do |scene|
      unless @scene.destinations.include? scene
        @link_options.push [scene.title,scene.id]
      end #unless
    end #adv_scenes.each

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
    Scene.find(params[:id]).destroy

    redirect_to scenes_path
  end

  #----------------NON-STANDARD-CRUD----------------

  def new
    @scene = Scene.new

    @origin = Scene.find params[:origin_id]
  end

  def create
    #create a new scene
    @scene = Scene.new(params[:scene])

    #find the origin to this scene for linking (a path)
    origin = Scene.find params[:origin_id]

    #add the scene to the same adventure as the origin
    @scene.adventure = origin.adventure

    if @scene.save

      #add the path to the new scene to the origin scene
      origin.destinations << @scene

      #get the path between the origin and this new scene so we can set its text
      path = origin.paths.where("destination_id = ?",@scene.id).first
      path.description = params[:path_desc]
      path.save

      redirect_to @scene
    else
      render 'new'
    end
  end

end