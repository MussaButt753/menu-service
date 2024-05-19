# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :identifier, null: false, index: { unique: true }
      t.string :type, null: false, index: true
      t.string :label, null: false
      t.string :description
      t.float :price, null: false

      t.timestamps
    end
  end
end
