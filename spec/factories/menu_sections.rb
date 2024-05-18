# frozen_string_literal: true

FactoryBot.define do
  factory :menu_section do
    default_order { 0 }

    menu
    section
  end
end
