user  = User.create! name: 'User#1'

Transaction.create! user: user, balance: user.balance, value: 1
Transaction.create! user: user, balance: user.balance, value: 1.5
Transaction.create! user: user, balance: user.balance, value: 4
Transaction.create! user: user, balance: user.balance, value: 21
