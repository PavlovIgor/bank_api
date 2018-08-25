require 'rails_helper'

RSpec.describe AccountCreationFacade do
  before { @acf = AccountCreationFacade.new }

  it { expect(@acf.request).to include(:id) }
  it { expect(@acf.request).to include(:secret_key) }
  it { expect(@acf.request[:secret_key]).to match(/^0{4}/) }
  it { expect(@acf.request).to include(:acc_hash) }
  it { expect(@acf.request[:acc_hash]).to match(/^0{4}/) }
  it { expect(@acf.request).to include(:status) }
  it { expect(@acf.status).to eq(:created) }
  it { expect(Account.all.count).to eq(1) }
end
