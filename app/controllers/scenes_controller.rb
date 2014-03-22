class ScenesController < ApplicationController

  def index
    @scenes = Scene.all
  end

  def show
    @scene = Scene.find params[:id]
  end

  def new
    @scene = Scene.new
  end

  def create
    @scene = Scene.new(params[:scene])

    if @scene.save
      redirect_to @scene
    else
      render 'new'
    end
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

  #----------------NON-CRUD----------------

  def new_link
    @scene = Scene.new

    @origin = Scene.find params[:origin_id]
  end

  def create_link
    #create a new scene
    @scene = Scene.new(params[:scene])

    #find the origin to this scene for linking (a path)
    origin = Scene.find params[:origin_id]

    #add the path to the new scene to the origin scene
    origin.destinations << @scene

    #get the path between the origin and this new scene so we can set its text
    path = origin.paths.where("destination_id = ?",@scene.id).first
    path.description = params[:path_desc]
    path.save

    #add the scene to the same adventure as the origin
    @scene.adventure = origin.adventure

    if @scene.save
      redirect_to @scene
    else
      render 'new_link'
    end
  end

end