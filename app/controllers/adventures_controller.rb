class AdventuresController < ApplicationController

  #must be logged in to use these functions
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  #must be the owner to use these functions
  before_filter :check_owner?, :only => [:update, :destroy]

  def index
    @adventures = Adventure.all
  end

  def show
    @adventure = Adventure.find params[:id]

    #check for orphaned scenes
    @orphans = @adventure.scenes.select { |scene| scene.origins.empty? && scene.not_start? }

    #check for dead ends
    @dead_ends = @adventure.scenes.select { |scene| scene.destinations.empty? && scene.end == false }

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

  private
  #security to prevent updating if not your content
  def check_owner?
    adventure = Adventure.find(params[:id])
    redirect_to adventure if adventure.user_id != current_user.id 
  end

end