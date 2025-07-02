FactoryBot.define do
  factory :quote do
    association :company
    name { "MyString" }
  end
end
