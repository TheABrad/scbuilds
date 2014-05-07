class WelcomeController < ApplicationController
  def index
    @latest_builds = Build.recent.load().take(6)
  end
end
