class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :value, default: 0
      t.belongs_to :user
      t.belongs_to :balance

      t.timestamps
    end
  end
end
