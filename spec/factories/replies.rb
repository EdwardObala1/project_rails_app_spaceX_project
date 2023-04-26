FactoryBot.define do
  factory :reply do
    association :comment
    reply { "MyString" }
  end
end
