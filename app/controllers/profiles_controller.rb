class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose(:products) { current_user.products }
  expose(:reviews) { current_user.reviews }
  expose(:user)
  expose_decorated(:user)

  def show
  end
end
