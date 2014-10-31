require 'spec_helper'

describe 'balances/show.json.jbuilder' do
  before(:each) do
    user = User.create name: 'User#5'
    @balance = user.balance

    assign(:balance, @balance)
  end

  attributes = %w[
    value
    user_name
  ]

  it "renders a balance as json with following attributes: #{attributes.join(', ')}" do
    render

    hash = JSON.parse(rendered)

    expect(hash).to be_kind_of(Hash)
    expect(hash.keys.sort).to eq attributes.sort

		expect(hash['value']).to eq @balance.value
		expect(hash['user_name']).to eq @balance.user.name
  end
end
