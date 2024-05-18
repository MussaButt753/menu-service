# frozen_string_literal: true

FactoryBot.define do
  factory :modifier_group do
    label { 'MyString' }
    selection_required_min { 1 }
    selection_required_max { 2 }
  end
end
