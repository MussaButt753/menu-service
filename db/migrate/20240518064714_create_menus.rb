# frozen_string_literal: true

class CreateMenus < ActiveRecord::Migration[7.1]
  def change
    create_table :menus do |t|
      t.string :identifier, null: false, index: { unique: true }
      t.string :label, null: false
      t.string :state
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
