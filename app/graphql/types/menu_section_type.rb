# frozen_string_literal: true

module Types
  class MenuSectionType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Integer, null: false

    field :section, SectionType, null: false
    field :menu, MenuType, null: false
  end
end
