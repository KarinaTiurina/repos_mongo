FactoryBot.define do
  factory :repository do
    sequence (:name) { |n| "repository#{n}" }
  end
end
