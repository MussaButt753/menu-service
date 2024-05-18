# frozen_string_literal: true

FactoryBot.define do
  factory :menu_section do
    menu { nil }
    section { nil }
    default_order { 1 }
  end
end
