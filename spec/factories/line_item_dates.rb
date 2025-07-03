FactoryBot.define do
  factory :line_item_date do
    association :quote
    date { "2025-07-02" }
  end
end
