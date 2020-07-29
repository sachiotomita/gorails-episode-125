class MainController < ApplicationController
  def index

    @notifications = current_user.notifications
  end
end
