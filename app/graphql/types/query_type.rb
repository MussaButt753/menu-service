# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :menus, resolver: Resolvers::Menus
    field :menu, resolver: Resolvers::Menu

    field :sections, resolver: Resolvers::Sections
    field :section, resolver: Resolvers::Section

    field :items, resolver: Resolvers::Items
    field :item, resolver: Resolvers::Item

    field :modifier_groups, resolver: Resolvers::ModifierGroups
    field :modifier_group, resolver: Resolvers::ModifierGroup

    field :modifiers, resolver: Resolvers::Modifiers
    field :modifier, resolver: Resolvers::Modifier
  end
end
