class AccountCreationFacade

  def initialize
    mining_encryption
    @account = Account.new({
      acc_hash: @acc_hash,
      timestamp: @timestamp,
      nonce: @nonce
    })
    @status = @account.save ? :created : :unprocessable_entity
  end

  def request
    {
      id: @account.id,
      secret_key: @secret_key,
      acc_hash: @account.acc_hash,
      status: @status
    }
  end

  def status
    @status
  end

private

  def mining_encryption
    @secret_key = Miner.secret_key
    @acc_hash, @timestamp, @nonce = Miner.acc_hash(@secret_key)
  end

end
