# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_item, mutation: Mutations::DeleteItem
    field :update_item, mutation: Mutations::UpdateItem
    field :create_item, mutation: Mutations::CreateItem

    field :create_menu, mutation: Mutations::CreateMenu
    field :update_menu, mutation: Mutations::UpdateMenu


    field :create_menu_section, mutation: Mutations::CreateMenuSection

    field :create_section, mutation: Mutations::CreateSection
    field :update_section, mutation: Mutations::UpdateSection

    field :create_section_item, mutation: Mutations::CreateSectionItem

    field :create_modifier, mutation: Mutations::CreateModifier
    field :update_modifier, mutation: Mutations::UpdateModifier


    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
    field :update_modifier_group, mutation: Mutations::UpdateModifierGroup


    field :create_item_modifier_group, mutation: Mutations::CreateItemModifierGroup
  end
end
