FactoryBot.define do
  factory :line_item do
    association :line_item_date
    name { "MyString" }
    description { "MyText" }
    quantity { 1 }
    unit_price { "9.99" }
  end
end
