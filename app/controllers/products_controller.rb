class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_filter :require_permission, only: [:edit, :update, :destory]
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)
  expose_decorated(:products, ancestor: :category)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    self.product = Product.new(product_params)
    product.user_id = current_user.id
    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def require_permission
    if current_user != product.user
      redirect_to category_product_url(category, product) 
      flash[:error] = 'You are not allowed to edit this product.'
    end    
  end
end
