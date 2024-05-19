# frozen_string_literal: true

module ModifierGroups
  class Finder < DelegateClass(ActiveRecord::Relation)
    def initialize(scope = ModifierGroup.all)
      super(scope)
    end

    def with_label(label)
      return self if label.blank?

      update_scope where(label:)
    end

    private

    def update_scope(new_scope)
      __setobj__ new_scope
      self
    end
  end
end
