# frozen_string_literal: true

module Items
  class UpdateService
    def initialize(input:)
      @input = input
    end

    def call
      item.tap { item.update!(@input.except(:id)) }
    end

    private

    def item
      @item ||= Item.find(@input[:id])
    end
  end
end
