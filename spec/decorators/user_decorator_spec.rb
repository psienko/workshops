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
end
