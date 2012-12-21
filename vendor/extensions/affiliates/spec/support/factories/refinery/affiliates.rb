
FactoryGirl.define do
  factory :affiliate, :class => Refinery::Affiliates::Affiliate do
    sequence(:url) { |n| "refinery#{n}" }
  end
end

