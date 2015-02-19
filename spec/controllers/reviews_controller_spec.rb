require 'spec_helper'

describe ReviewsController do
  let(:valid_attributes) { { content: 'MyString', rating: '5' } }

  let(:valid_session) { {} }

  let(:user) { create(:user) }
  let(:product) { create(:product) }

  before do
    sign_in user
    controller.stub(:user_signed_in?).and_return(true)
    controller.stub(:current_user).and_return(user)
    controller.stub(:authenticate_user!).and_return(user)
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Review' do
        expect do
          post :create, {
            review: valid_attributes,
            category_id: product.category.to_param,
            product_id: product.to_param
          }, valid_session
        end.to change(Review, :count).by(1)
      end

      it 'assigns correct owner to Review' do
        post :create, {
          review: valid_attributes,
          category_id: product.category.to_param,
          product_id: product.to_param
        }, valid_session
        expect(controller.review.user.id).to eq(user.id)
      end
    end
  end

end