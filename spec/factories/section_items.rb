FactoryBot.define do
  factory :section_item do
    section
    item
    dafault_order { 1 }
  end
end
