class Account < ApplicationRecord
  validates :timestamp, :acc_hash, :nonce, presence: true
  validates :acc_hash, uniqueness: true, format: { with: Regexp.new('\A0{4}') }
  validates :nonce, numericality: { greater_than: 0 }


  def secret_valid?(secret_key)
    acc_hash == Digest::SHA256.hexdigest("#{timestamp}#{nonce}#{secret_key}")
  end

end
