require 'rails_helper'

RSpec.describe Miner do
  let(:secret_key){ Miner.secret_key }

  it { expect(Miner.secret_key).to match(/^0{4}/) }
  it { expect(Miner.acc_hash(secret_key)[0]).to match(/^0{4}/) }
  it { expect(Miner.acc_hash(secret_key)[0]).to be_a(String) }
  it { expect(Miner.acc_hash(secret_key)[1]).to be_a(Integer) }
  it { expect(Miner.acc_hash(secret_key)[2]).to be_a(Integer) }
end
