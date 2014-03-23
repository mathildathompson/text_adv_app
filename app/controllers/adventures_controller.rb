class AdventuresController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @adventures = Adventure.all
  end

  def show
    @adventure = Adventure.find params[:id]

    #check for orphaned scenes (where no destinations and not the end)
    @orphans = []
    @adventure.scenes.each do |scene|
      if scene.destinations.empty? && scene.end == false
        @orphans << scene
      end
    end

    #binding.pry

  end

  def new
    @adventure = Adventure.new
  end

  def create

    #create a new adventure for the logged in user and set status to draft
    @adventure = current_user.adventures.new(params[:adventure])
    @adventure.status = 'Draft'

    if @adventure.save
      #create a scene
      scene = Scene.new(:title => 'First Scene', :description => 'Opening Scene Text Here...', :multivisit => true, :end => false)

      #add this to adventure.scenes
      @adventure.scenes << scene

      #set this as the first scene
      @adventure.start_scene_id = scene.id

      #save again
      @adventure.save

      redirect_to @adventure
    else
      render 'new'
    end

  end

  def edit
    @adventure = Adventure.find params[:id]

    #set options for selection
    @statuses = [['Draft','Draft'],['Published','Published']]
  end

  def update
    @adventure = Adventure.find params[:id]
    
    if @adventure.update_attributes(params[:adventure])
      redirect_to @adventure
    else
      render 'update'
    end
  end

  def destroy
    Adventure.find(params[:id]).destroy

    redirect_to adventures_path
  end

end