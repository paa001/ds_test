require 'rails_helper'

describe BalancesController do
  before do
    user1  = User.create! name: 'User#1'
    user2  = User.create! name: 'User#1'

    @balance1 = user1.balance
    @balance2 = user2.balance
  end

  describe 'GET index' do
    it 'assigns all balances as @balances' do
      get :index, {format: :json}
      expect(assigns(:balances)).to match_array([@balance1, @balance2])
    end
  end

  describe 'GET show' do
    it 'assigns balance as @balance' do
      get 'show', {format: :json, id: @balance1.to_param}
      expect(assigns(:balance)).to eq(@balance1)
    end
  end
end
