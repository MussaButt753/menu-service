# frozen_string_literal: true

module Menus
  class CreateService
    def initialize(input:)
      @input = input
    end

    def call
      Menu.create!(@input)
    end
  end
end
