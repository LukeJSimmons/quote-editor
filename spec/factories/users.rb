FactoryBot.define do
  factory :user do
   association :company
    email { "accountant@kpmg.com" }
    password { 'password' }
  end
end
