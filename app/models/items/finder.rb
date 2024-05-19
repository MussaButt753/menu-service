# frozen_string_literal: true

module Items
  class Finder < DelegateClass(ActiveRecord::Relation)
    def initialize(scope = Item.all)
      super(scope)
    end

    def with_label(label)
      return self if label.blank?

      update_scope where(label:)
    end

    def with_type(type)
      return self if type.blank?

      update_scope where(type:)
    end

    private

    def update_scope(new_scope)
      __setobj__ new_scope
      self
    end
  end
end
