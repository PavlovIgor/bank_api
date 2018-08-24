FactoryBot.define do
  factory :account do
    timestamp { "2018-08-24 05:49:20" }
    acc_hash { "0000082dfc0afa243c474f42a01e61c16b174ddd9c6c1556dcb536fd92859dc1" }
    nonce { 1 }

    trait :nil_timestamp do nonce { nil } end
    trait :nil_acc_hash do nonce { nil } end
    trait :nil_nonce do nonce { nil } end
    trait :empty_timestamp do timestamp { "" } end
    trait :empty_acc_hash do acc_hash { "" } end
    trait :empty_nonce do nonce { 0 } end

    trait :not_valid_hash do acc_hash { "ba9cfdda5b3a15c154b5744141bb8096528d2328fbbfe5223930056e4b006125" } end

  end
end
