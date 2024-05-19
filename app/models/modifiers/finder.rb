# frozen_string_literal: true

module Modifiers
  class Finder < DelegateClass(ActiveRecord::Relation)
    def initialize(scope = Modifier.all)
      super(scope)
    end

    private

    def update_scope(new_scope)
      __setobj__ new_scope
      self
    end
  end
end
