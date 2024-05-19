# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_item, mutation: Mutations::DeleteItem
    field :update_item, mutation: Mutations::UpdateItem
    field :create_item, mutation: Mutations::CreateItem

    field :create_menu, mutation: Mutations::CreateMenu

    field :create_menu_section, mutation: Mutations::CreateMenuSection

    field :create_section, mutation: Mutations::CreateSection

    field :create_section_item, mutation: Mutations::CreateSectionItem

    field :create_modifier, mutation: Mutations::CreateModifier

    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
  end
end
