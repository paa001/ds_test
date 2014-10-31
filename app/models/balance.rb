# == Schema Information
#
# Table name: balances
#
#  id         :integer          not null, primary key
#  value      :float            default(0.0)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Balance < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :user_id, presence: true
end
