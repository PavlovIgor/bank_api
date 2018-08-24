class Account < ApplicationRecord
  validates :timestamp, :acc_hash, :nonce, presence: true
  validates :acc_hash, uniqueness: true, format: {with: Regexp.new('\A0{5}')}
  validates :nonce, numericality: {greater_than: 0}
end
