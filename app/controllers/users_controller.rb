class UsersController < ApplicationController
  def show
      @user = User.friendly.find(params[:id])
      @builds = Build.where(user_id: current_user.id)
  end
end
