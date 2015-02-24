class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose(:products) { user.products }
  expose(:reviews) { user.reviews }
  expose(:user)
  expose_decorated(:user)

  def show
  end
end
