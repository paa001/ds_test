require 'rails_helper'

describe TransactionsController do
  before do
    @user  = User.create! name: 'User#1'
    user2  = User.create! name: 'User#1'

    @transaction1 = Transaction.create! user: @user, balance: @user.balance, value: 1
    @transaction2 = Transaction.create! user: user2, balance: @user.balance, value: 1
  end

  describe 'GET index' do
    it 'assigns all transactions as @transactions' do
      get :index, {format: :json}
      expect(assigns(:transactions)).to match_array([@transaction1, @transaction2])
    end

    it "assigns the requested transactions as @transactions" do
      get :index, {format: :json, user_id: @user.id}
      expect(assigns(:transactions)).to match_array([@transaction1])
    end
  end

  describe 'GET show' do
    it 'assigns transaction as @transaction' do
      get 'show', {format: :json, id: @transaction1.to_param}
      expect(assigns(:transaction)).to eq(@transaction1)
    end
  end
end
