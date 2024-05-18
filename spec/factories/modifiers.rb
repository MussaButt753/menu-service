# frozen_string_literal: true

FactoryBot.define do
  factory :modifier do
    item { nil }
    modifier_group { nil }
    display_order { 1 }
    default_quantity { 1 }
  end
end
