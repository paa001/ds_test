class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.float :value, default: 0
      t.belongs_to :user

      t.timestamps
    end
  end
end
