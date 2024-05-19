# frozen_string_literal: true

module Sections
  class Finder < DelegateClass(ActiveRecord::Relation)
    def initialize(scope = Section.all)
      super(scope)
    end

    def with_label(label)
      return self if label.blank?

      update_scope where(label:)
    end

    def with_menu_id(menu_id)
      return self if menu_id.blank?

      update_scope joins(:menu_section).where(menu_sections: { menu_id: })
    end

    private

    def update_scope(new_scope)
      __setobj__ new_scope
      self
    end
  end
end
