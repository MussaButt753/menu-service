# frozen_string_literal: true

FactoryBot.define do
  factory :modifier do
    display_order { 1 }
    default_quantity { 1 }

    item
    modifier_group
  end
end
