class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:user)
  expose_decorated(:reviews) { user.reviews.order('created_at desc').limit(5) }

  def show
  end
end
