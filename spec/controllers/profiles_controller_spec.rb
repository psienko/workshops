require 'spec_helper'

describe ProfilesController do

  let(:user) { create(:user) }

  context 'user is signed in' do
    before do
      sign_in user
      controller.stub(:current_user).and_return(user)
      controller.stub(:authenticate_user!).and_return(user)
    end

    describe 'GET show' do
      it 'returns http success' do
        get :show, { id: user.to_param }
        expect(response).to have_http_status(:success)
      end

      it 'renders the profile page template' do
        get :show, { id: user.to_param }
        expect(response).to render_template('show')
      end

      it 'exposes the requested user' do
        get :show, { id: user.to_param }
        expect(controller.user).to eq(user)
      end

      it 'exposes the user products' do
        create :product, user_id: user.id
        create :product
        get :show, { id: user.to_param }
        expect(controller.products).to eq(user.products)
      end

      it 'exposes the user reviews' do
        create :review, user_id: user.id
        create :review
        get :show, { id: user.to_param }
        expect(controller.reviews).to eq(user.reviews)
      end
    end
  end

  context 'user is not signed in' do
    describe 'GET show' do
      it 'redirects the user to the login page' do
        get :show, { id: user.to_param }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
