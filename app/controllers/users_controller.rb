class UsersController < ApplicationController
  def show
      @user = User.friendly.find(params[:id])
      @builds = Build.where(user_id: @user.id)
  end
end
