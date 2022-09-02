class Section < ApplicationRecord
  def self.all_parents
    Section.find_by_sql("SELECT * FROM sections WHERE parent_id IS NULL")
  end

  def sub_sections
    Section.find_by_sql("SELECT * FROM sections WHERE parent_id IS #{self.id}")
  end
end
