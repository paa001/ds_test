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

    it 'assigns the requested transactions as @transactions' do
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

  describe 'POST create' do
    it 'creates a new Transaction' do
      expect {
        post 'create', {format: :json}
          .merge(transaction: {balance_id: @user.balance.to_param, user_id: @user.to_param, value: 1})
      }.to change(Transaction, :count).by(1)
    end
  end

  describe 'PUT update' do
    it 'changes Transaction' do
      put 'update', {format: :json, id: @transaction1.to_param}.merge(transaction: {value: 11})
      expect(assigns(:transaction).value).to eq(11)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested Transaction" do
      expect {
        delete 'destroy', {format: :json, id: @transaction1.to_param}
      }.to change(Transaction, :count).by(-1)
    end
  end
end
