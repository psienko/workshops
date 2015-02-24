require 'spec_helper'

describe UserDecorator do

  let(:standard_user) { described_class.new(create(:user)) }
  let(:admin) { described_class.new(create(:user, admin: true)) }

  context 'user is the admin' do
    before do
      sign_in admin
    end

    describe '#role' do
      it "displays 'admin'" do
        expect(admin.role).to eq('admin')
      end
    end
  end

  context 'user is not the admin' do
    before do
      sign_in standard_user
    end

    describe '#role' do
      it "displays 'standard user'" do
        expect(standard_user.role).to eq('standard user')
      end
    end
  end

  context 'user is not the owner of the profile' do
    before do
      sign_in admin
    end

    describe '#display_edit_button_in_panel_footer' do
      it 'return nil' do
        expect(standard_user.display_edit_button_in_panel_footer).to be_nil
      end
    end
  end

  describe '#edit' do
    it "displays the 'Edit My Profile' link" do
      expect(admin.edit).to have_selector('a', text: 'Edit My Profile')
    end
  end
end
