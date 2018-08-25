require 'digest'

class Miner

  def self.secret_key
    timestamp, secret_key, nonce = nil, "", 0

    while secret_key[0..3] != "0000" do
      timestamp = Time.now.nsec
      nonce += 1
      secret_key = Digest::SHA512.hexdigest("#{timestamp}#{nonce}")
    end

    secret_key
  end

  def self.acc_hash(secret_key)
    timestamp, acc_hash, nonce = nil, "", 0

    while acc_hash[0..3] != "0000" do
      timestamp = Time.now.nsec
      nonce += 1
      acc_hash = Digest::SHA256.hexdigest("#{timestamp}#{nonce}#{secret_key}")
    end

    [acc_hash, timestamp, nonce]
  end
end
