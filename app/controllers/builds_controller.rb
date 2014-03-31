class BuildsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @builds = Build.where(true).load.recent
  end

  def show
    @build = Build.find(params[:id])
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
    @build = Build.find(params[:id])
  end

  def update
    @build = Build.find(params[:id])

    if @build.update(build_params)
      flash[:success] = "Build Updated!"
      redirect_to @build
    else
      render action: 'edit'
    end
  end

  def destroy
    @build = Build.find(params[:id])
    @build.destroy
    redirect_to build_path
  end

  private

  def build_params 
    params[:build].permit(:title, :race, :vs_race, :body, :replays)
  end
end
