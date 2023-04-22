# This will guess the User class
FactoryBot.define do
  factory :user do
    user_name { 'JohnDoe' }
    email  { 'johndoe@gmail.com' }
    password { "testPassword123!" }
  end
end