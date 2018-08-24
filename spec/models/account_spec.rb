require 'rails_helper'

RSpec.describe Account, type: :model do
  # Valid account
  let(:account){ build :account }

  # Not valid accounts
  let(:nil_timestamp){ build :account, :nil_timestamp }
  let(:nil_acc_hash){ build :account, :nil_acc_hash }
  let(:nil_nonce){ build :account, :nil_nonce }
  let(:empty_timestamp){ build :account, :empty_timestamp }
  let(:empty_acc_hash){ build :account, :empty_acc_hash }
  let(:empty_nonce){ build :account, :empty_nonce }
  let(:not_valid_hash){ build :account, :not_valid_hash }


  it { expect(account).to be_valid }

  it { expect(nil_timestamp).not_to be_valid }
  it { expect(nil_acc_hash).not_to be_valid }
  it { expect(nil_nonce).not_to be_valid }
  it { expect(empty_timestamp).not_to be_valid }
  it { expect(empty_acc_hash).not_to be_valid }
  it { expect(empty_nonce).not_to be_valid }
  it { expect(not_valid_hash).not_to be_valid }

  it "should expect uniqueness" do
    create :account
    expect(account).not_to be_valid
  end
end
