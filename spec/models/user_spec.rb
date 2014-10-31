require 'spec_helper'

describe User do
  before do
    @user  = User.create! name: 'User#1'
  end

  subject { @user }
  it { is_expected.to be_valid }

  describe :class do
    it 'should create balance' do
      user  = User.create! name: 'User#2'
      expect(user.balance.value).to eq(0.0)
    end
  end
end
