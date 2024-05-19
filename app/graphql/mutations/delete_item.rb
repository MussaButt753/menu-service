# frozen_string_literal: true

module Mutations
  class DeleteItem < BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      item = Item.find_by(id:)
      if item
        item.destroy
        { success: true }
      else
        { success: false }
      end
    end
  end
end
