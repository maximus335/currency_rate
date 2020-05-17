FactoryBot.define do
  factory :force_rate do
    rate { 30.00 }
    expire_datetime { Time.now }
  end
end