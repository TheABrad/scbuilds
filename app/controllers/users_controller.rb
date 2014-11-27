class UsersController < ApplicationController
  def show
      @user = User.friendly.find(params[:id].to_s.downcase) 
  end
end
