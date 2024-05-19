# frozen_string_literal: true

module Menus
  class UpdateService
    def initialize(input:)
      @input = input
    end

    def call
      menu.tap { menu.update!(@input.except(:id)) }
    end

    private

    def menu
      @menu ||= Menu.find(@input[:id])
    end
  end
end
