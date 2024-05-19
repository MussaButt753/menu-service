# frozen_string_literal: true

class CreateModifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :modifiers do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true
      t.integer :display_order, null: false, default: 0
      t.integer :default_quantity, null: false, default: 0
      t.float :price_override

      t.timestamps
    end
  end
end
