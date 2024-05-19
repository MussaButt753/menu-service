# frozen_string_literal: true

module Enums
  class ItemTypesEnum < GraphQL::Enum
    ::Item::ALLOWED_TYPES.each { |allowed_type| add allowed_type }
  end
end
