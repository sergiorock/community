class HomeController < ApplicationController
  def index
    @images = Image.order(id: :desc).where user_id: current_user.id
  end
end
