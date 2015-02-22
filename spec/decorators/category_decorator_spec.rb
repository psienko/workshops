require 'spec_helper'

describe CategoryDecorator do

  let(:user) { build(:user) }
  let(:category) { described_class.new(build(:category)) }

  context 'user is an admin' do
    describe '#new_category' do
      it "displays the 'New Category' link" do
        expect(category.new_category).to have_selector('a', text: 'New Category')
      end
    end
  end
end
