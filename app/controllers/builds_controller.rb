class BuildsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    if params[:race]
      @builds = Build.where(race: params[:race]).load.recent 
    else
      @builds = Build.where(true).load.recent
    end
  end

  def show
    @build = Build.friendly.find(params[:id])
  end

  def new
    @build = Build.new
  end

  def create
    @build = Build.new(build_params)
    @build.user_id = current_user.id
    if @build.save
      flash[:success] = "Build Created!"
      redirect_to @build
    else
      render action: 'new'
    end
  end

  def edit
    @build = Build.friendly.find(params[:id])
  end

  def update
    @build = Build.friendly.find(params[:id])

    if @build.update(build_params)
      flash[:success] = "Build Updated!"
      redirect_to @build
    else
      render action: 'edit'
    end
  end

  def destroy
    @build = Build.friendly.find(params[:id])
    @build.destroy
    redirect_to build_path
  end

  private

  def build_params 
    params[:build].permit(:title, :race, :vs_race, :body, :replays)
  end
end
