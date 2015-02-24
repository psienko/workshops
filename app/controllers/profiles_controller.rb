class ProfilesController < ApplicationController
  before_action :authenticate_user!

  expose(:products) { current_user.products }
  expose(:reviews) { current_user.reviews }

  def show
  end
end
