
FactoryGirl.define do
  factory :checking, :class => Refinery::Checkings::Checking do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

