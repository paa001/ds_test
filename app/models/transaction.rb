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

  after_save    :update_balance
  after_destroy :update_balance

  validates :balance_id, :user_id, presence: true

  scope :on_user, -> (user_id) { where(user_id: user_id) }

  private

    def update_balance
      balance.with_lock do
        balance.value = balance.transactions.pluck(:value).sum
        balance.save!
      end
    end
end
