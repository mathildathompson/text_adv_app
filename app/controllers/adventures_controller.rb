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

  end

  def new
    @adventure = Adventure.new
  end

  def create

    @adventure = current_user.adventure.new(params[:adventure])
    @adventure.status = 'Draft'
    @adventure.user_id = current_user.id

    if @adventure.save
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