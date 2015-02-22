require 'spec_helper'

describe ProductDecorator do

  let(:user) { create(:user) }
  let(:owner) { create(:user) }
  let(:product) { described_class.new(create(:product, user: owner)) }
  
  context 'user is the owner of product' do

    before do
      sign_in owner
    end
    
    describe '#edit_product' do
      it "displays the 'Edit' link" do
        expect(product.edit_product).to have_selector('a', text: 'Edit')
      end
    end
  end

  context 'user is not the owner of product' do

    before do
      sign_in user
    end
    
    describe '#edit_product' do
      it "does not display the 'Edit' link" do
        expect(product.edit_product).to be_nil
      end
    end
  end
end
