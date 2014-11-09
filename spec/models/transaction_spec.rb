require 'spec_helper'

describe Transaction do
  before do
    @user  = User.create! name: 'User#1'
    @valid_attributes = { user: @user, balance: @user.balance, value: 1 }
    @transaction = Transaction.create user: @user, balance: @user.balance, value: 1
  end

  subject { Transaction.create @valid_attributes }
  it { is_expected.to be_valid }

  describe :class do
    it 'should incremented balance' do
      transaction1 = Transaction.create user: @user, balance: @user.balance, value: 1
      transaction2 = Transaction.create user: @user, balance: @user.balance, value: 2
      expect(@user.balance.value).to eq(4.0)
    end

    it 'should updated balance, if update Transaction' do
      transaction1 = Transaction.create user: @user, balance: @user.balance, value: 1
      @transaction.update_attributes(value: 3)
      expect(@user.balance.value).to eq(4.0)
    end

    it 'should decremented balance, if delete Transaction' do
      transaction1 = Transaction.create user: @user, balance: @user.balance, value: 2
      @transaction.destroy
      expect(@user.balance.value).to eq(2.0)
    end
  end

end
