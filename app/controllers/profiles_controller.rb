class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose(:reviews) { user.reviews.order('created_at desc').limit(5) }
  expose(:user)
  expose_decorated(:user)

  def show
  end
end
