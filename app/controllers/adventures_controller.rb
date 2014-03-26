class AdventuresController < ApplicationController

  #must be logged in to use these functions
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy, :my_creations]
  #must be the owner of the adventure to use these functions
  before_filter :check_editable?, :only => [:edit, :update, :destroy]
  #if adventure is in 'Draft' status, you must be the owner to view
  before_filter :check_published?, :only => [:show]

  def index
    #display ONLY published adventures
    @adventures = Adventure.where(:status => 'Published')
  end

  #----------- NON STANDARD CRUD -----------
  def my_creations
    @adventures = Adventure.where("user_id = #{current_user.id}")
  end
  #-----------------------------------------

  def show
    @adventure = Adventure.find params[:id]
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
  end

  def update
    @adventure = Adventure.find params[:id]
    
    if @adventure.update_attributes(params[:adventure])
      redirect_to @adventure
    else
      render 'edit'
    end
  end

  def destroy
    Adventure.find(params[:id]).destroy

    redirect_to adventures_path
  end

  #------------------------------------------------

  private
  #security to prevent updating if not your content
  def check_editable?
    adventure = Adventure.find(params[:id])
    redirect_to adventure_path if adventure.user != current_user
  end

  def check_published?
    adventure = Adventure.find(params[:id])
    redirect_to adventures_path if adventure.status == 'Draft' && adventure.user != current_user
  end
end