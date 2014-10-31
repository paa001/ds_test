require 'spec_helper'

describe 'transactions/index.json.jbuilder' do
  before(:each) do
    user = User.create name: 'User#5'
    @transaction = Transaction.create! user: user, balance: user.balance, value: 1

    assign(:transactions, [@transaction, @transaction])
  end

  attributes = %w[
		value
    created_at
		user_name
  ]

  it "renders a list of transactions as json with following attributes: #{attributes.join(', ')}" do
    render

    hash = JSON.parse(rendered)

    expect(hash).to be_kind_of(Array)
    expect(hash.first).to eq(hash = hash.last)

    expect(hash).to be_kind_of(Hash)
    expect(hash.keys.sort).to eq attributes.sort

		expect(hash['value']).to eq @transaction.value
		expect(hash['user_name']).to eq @transaction.user.name
  end
end
