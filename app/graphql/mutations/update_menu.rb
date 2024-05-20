# frozen_string_literal: true

module Mutations
  class UpdateMenu < BaseMutation
    argument :id, ID, required: true
    argument :label, String, required: true
    argument :state, String, required: true
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false


    field :menu, Types::MenuType, null: false

    def resolve(args)
      {
        menu: Menus::UpdateService.new(input: args).call
      }
    end
  end
end
