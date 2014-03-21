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

end