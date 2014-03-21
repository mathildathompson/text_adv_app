class AdventuresController < ApplicationController

  def index
    @adventures = Adventure.all
  end

  def show
    @adventure = Adventure.find params[:id]
  end

  def new
    @adventure = Adventure.new
  end

  def create
    @adventure = Adventure.new(params[:adventure])
    @adventure.status = 'Draft'

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