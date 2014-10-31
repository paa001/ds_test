# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  value      :float            default(0.0)
#  user_id    :integer
#  balance_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Transaction < ActiveRecord::Base
  belongs_to :balance
  belongs_to :user

  after_save    :balance_increment
  after_destroy :balance_decrement

  validates :balance_id, :user_id, presence: true

  scope :on_user, -> (user_id) { where(user_id: user_id) }

  private

  def balance_increment
    update_balance()
  end

  def balance_decrement
    update_balance(-1)
  end

  def update_balance(factor=1)
    balance.with_lock do
      balance.value += (self.value*factor)
      balance.save!
    end
  end
end
