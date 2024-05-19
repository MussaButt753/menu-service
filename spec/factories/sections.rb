# frozen_string_literal: true

FactoryBot.define do
  factory :section do
    sequence(:identifier)
    label { 'MyString' }
    description { 'MyString' }
  end
end
