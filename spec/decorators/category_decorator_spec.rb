require 'spec_helper'

describe CategoryDecorator do

  let(:admin) { build(:user, admin: true) }
  let(:user) { build(:user) }
  let(:category) { described_class.new(create(:category)) }

  context 'user is an admin' do
    before do
      sign_in admin
    end

    describe '#new_category' do
      it "displays the 'New Category' link" do
        expect(category.new_category).to have_selector('a', text: 'New Category')
      end
    end

    describe '#edit_category' do
      it "displays the 'Edit' link" do
        expect(category.edit_category).to have_selector('a', text: 'Edit')
      end
    end

  end

  context 'user is not an admin' do
    before do
      sign_in user
    end

    describe '#new_category' do
      it "does not display the 'New Category' link" do
        expect(category.new_category).to be_nil
      end
    end

    describe '#edit_category' do
      it "does not display the 'Edit' link" do
        expect(category.edit_category).to be_nil
      end
    end
  end
end
