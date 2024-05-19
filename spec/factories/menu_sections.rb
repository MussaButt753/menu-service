# frozen_string_literal: true

FactoryBot.define do
  factory :menu_section do
    display_order { 0 }

    menu
    section
  end
end
