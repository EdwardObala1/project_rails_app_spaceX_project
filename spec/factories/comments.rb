FactoryBot.define do
  factory :comment do
    association :user
    comment { "MyText" }
  end
end
