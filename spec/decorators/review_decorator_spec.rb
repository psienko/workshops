require 'spec_helper'

describe ReviewDecorator do

  let(:date) { DateTime.strptime('24/02/2015', '%d/%m/%Y') }
  let(:user) { build(:user, firstname: 'John', lastname: 'Doe') }
  let(:review) { described_class.new(build(:review, user: user, created_at: date)) }

  describe '#author' do
    it 'displays review author fullname' do
      expect(review.author).to eq 'John Doe'
    end
  end

  describe '#date' do
    it "displays date in the 'dd-mm-yy' format" do
      expect(review.date).to eq '24-02-15'
    end
  end
end
