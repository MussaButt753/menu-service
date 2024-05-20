# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

seed_data = YAML.load_file("db/seed_data.yml")

menus_data = seed_data["menus"]

menus_data.each do |menu_data|
  next if Menu.exists?(identifier: menu_data["identifier"])

  menu = Menu.create!(menu_data.slice("identifier", "label", "state", "start_date", "end_date"))

  menu_data["sections"].each do |section_data|
    section = Section.create(section_data.slice("label", "description", "identifier"))

    menu_section = menu.menu_sections.create!(section:, menu:, display_order: section_data["display_order"])

    section_data["items"].each do |item_data|
      product = Item.create!(item_data.slice("label", "price", "type", "description", "identifier"))

      section.section_items.create!(item: product, section:, display_order: item_data["display_order"])
      
      item_data["modifier_groups"].each do |modifier_group_data|
        modifier_group = ModifierGroup.create!(modifier_group_data.slice("identifier", "label", "selection_required_min", "selection_required_max"))
        modifier_group_data["modifiers"].each do |modifier_data|
          modifier_item = Item.create!(modifier_data["item"])
          modifier_group.modifiers.create!(
            modifier_data.slice("price_override", "default_quantity", "display_order").merge({ item: modifier_item})
          )
        end

        product.item_modifier_groups.create!(modifier_group:)
      end
    end
  end
end
