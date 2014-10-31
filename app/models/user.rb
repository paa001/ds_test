# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :transactions
  has_one :balance, dependent: :destroy

  after_create :create_balance

  validates :name, presence: true
end
