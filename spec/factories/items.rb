# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    sequence(:identifier)
    type { 'Product' }
    label { 'MyString' }
    description { 'MyString' }
    price { 1.5 }
  end

  factory :product, parent: :item do
    type { "Product" }
  end

  factory :component, parent: :item do
    type { "Component" }
  end
end
