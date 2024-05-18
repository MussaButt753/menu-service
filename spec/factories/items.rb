# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    type { '' }
    label { 'MyString' }
    description { 'MyString' }
    price { 1.5 }
  end
end
